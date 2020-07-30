//
//  SelfHideShow.swift
//  SnapKitDemo
//
//  Created by 尚雷勋 on 2020/7/30.
//

import UIKit
import SnapKit

class SelfHideShow: UIView {
    
    var cancel: UIButton!
    var done: UIButton!
    
    var label: UILabel!
    
    var viewH: CGFloat = UIScreen.main.bounds.height / 5.0 * 2.0
    
    var isShowing = true
    
    override init(frame: CGRect) {
        
        
        super.init(frame: frame)
        
        addSubViews()
        
        backgroundColor = .cyan
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        
        let btnSize = CGSize(width: 80, height: 40)
        let uiPadding = 16.0
        
        cancel = UIButton(type: .custom)
        cancel.setTitle("Cancel", for: .normal)
        cancel.backgroundColor = .black
        cancel.addTarget(self, action: #selector(self.hide), for: .touchUpInside)
        addSubview(cancel)
        done = UIButton(type: .custom)
        done.setTitle("Done", for: .normal)
        done.backgroundColor = .black
        done.addTarget(self, action: #selector(self.show), for: .touchUpInside)
        
        addSubview(done)
        
        cancel.snp.makeConstraints { (make) in
            
            make.top.equalToSuperview().offset(uiPadding)
            make.left.equalToSuperview().offset(uiPadding)
            make.size.equalTo(btnSize)
        }
        
        done.snp.makeConstraints { (make) in
            
            make.top.equalToSuperview().offset(uiPadding)
            make.right.equalToSuperview().offset(-uiPadding)
            make.size.equalTo(btnSize)
        }
        
        label = UILabel()
        label.textAlignment = .center
        
        
        addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(done.snp.bottom).offset(uiPadding)
            make.left.right.bottom.equalToSuperview()
        }
        
        label.text = "Label"
        label.font = .systemFont(ofSize: 50, weight: .heavy)
        
    }
    
    public func makeCons() {
        
        if let father = self.superview {
            
            self.snp.makeConstraints { (make) in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.top.equalTo(father.snp.bottom).offset(-viewH)
                make.height.equalTo(viewH)
            }
            
        }
    }
    
    @objc public func show() {
        isShowing = true
        letusUpdateFatherViewCon()
    }
    
    @objc public func hide() {
        isShowing = false
        letusUpdateFatherViewCon()
    }
    
    public func meUpdateCon() {
        
        let he = isShowing ? viewH : 40.0
        
        if let father = self.superview {
            self.snp.updateConstraints { (make) in
                make.top.equalTo(father.snp.bottom).offset(-he)
            }
        }
    }
    
    func letusUpdateFatherViewCon() {
        
        if let father = self.superview {
            
            // let rspd = viewCtrlFrom(view: self)
            
            father.setNeedsUpdateConstraints()
            father.updateConstraintsIfNeeded()
            UIView.animate(withDuration: 0.25) {
                father.layoutIfNeeded()
            }
        }
    }
    
    func viewCtrlFrom(view: UIView) -> UIViewController? {
        
        var father: UIView? = view
        
        repeat {
            if let rspd = father?.next as? UIViewController  {
                return rspd
            }
            father = father?.superview
            
        } while ( father != nil )
        
        return nil
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
