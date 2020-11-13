//
//  MainViewController.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/6.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor=UIColor.red;
        createTabs();
        
    }
    
    func createTabs(){
        let homevc = homeVC.init();
        homevc.tabBarItem=UITabBarItem.init(title: "主页", image: UIImage.init(named: "home_tabbar_night_32x32_"), selectedImage: UIImage.init(named: "home_tabbar_press_32x32_"));
        let homeNVC = MyNavigationController.init(rootViewController: homevc);

        // 知识体系
            let knowledgeVC = ProjectVC();
            knowledgeVC.tabBarItem = UITabBarItem(title: "项目",  image: UIImage(named: "huoshan_tabbar_night_32x32_"),
                                          selectedImage: UIImage(named: "huoshan_tabbar_press_32x32_"));
            let knowledgeNVC = MyNavigationController.init(rootViewController: knowledgeVC);
                     
            // 热门
            let hotVC = HotTabVC();
            hotVC.tabBarItem = UITabBarItem(title: "热门", image: UIImage(named: "weitoutiao_tabbar_night_32x32_"),
                                          selectedImage: UIImage(named: "weitoutiao_tabbar_press_32x32_"));
        let hotNVC = MyNavigationController.init(rootViewController: hotVC);
            
            // 我的
            let myVC = MyTabViewVC()
            myVC.tabBarItem = UITabBarItem(title: "我的",  image: UIImage(named: "mine_tabbar_night_32x32_"),
                                          selectedImage: UIImage(named: "mine_tabbar_press_32x32_"))
            let myNVC = MyNavigationController.init(rootViewController: myVC)
            
            self.viewControllers = [homeNVC, knowledgeNVC, hotNVC,myNVC];
        
    }
    
    
    
}
