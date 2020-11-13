//
//  ViewController.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/5.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func pushViewController(_ viewController:UIViewController ,animated: Bool){
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "lefterbackicon_titlebar_24x24_"), style: .plain, target: self, action: #selector(navigationBack))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc func navigationBack(){
       popViewController(animated: true)
    }
    
    
}

