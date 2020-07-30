//
//  DemoViewController.swift
//  SnapKitDemo
//
//  Created by 尚雷勋 on 2020/7/30.
//

import UIKit

class DemoViewController: UIViewController {
    
    var small: SelfHideShow?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        small = SelfHideShow()
        view.addSubview(small!)
        small?.makeCons()
    }
    
    override func updateViewConstraints() {
        
        small?.meUpdateCon()
        super.updateViewConstraints()
    }


}

