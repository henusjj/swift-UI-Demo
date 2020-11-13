//
//  AppDelegate.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/5.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let contentView = MainViewController();
        self.window = UIWindow.init(frame: UIScreen.main.bounds);
        self.window?.backgroundColor=UIColor.white;
        self.window?.rootViewController=contentView;//MyNavigationController.init(rootViewController: contentView);
        self.window?.makeKeyAndVisible();
        

        return true
    }

}

