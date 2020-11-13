//
//  UIAlertExtension.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/12.
//  Copyright © 2020 henusjj. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
//    普通提示框
    /**
     * -title :title
     * -message : message
     * -actionTitle : 按钮文本
     * - animated ：是否要动画
     * - viewController ：在什么控制器显示弹框
     *
     */
    static func showAlter(title : String,message : String, actionTile:String, animated : Bool, viewController:UIViewController){
        let alter = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alter.addAction(UIAlertAction.init(title: actionTile, style: .default, handler: nil))
        viewController.present(alter, animated: true, completion: nil)
    }
    
    /// 需要一个按钮回调的提示框
       /// - Parameters:
       ///   - title: title
       ///   - message: message
       ///   - actionTitle: 按钮文本
       ///   - animated: 是否要动画
       ///   - viewController: 在什么控制器显示弹框
       ///   - comfirm: 回调
       
       static func showAlertComfirm(title: String, message: String, actionTitle: String, animated: Bool, in viewController: UIViewController, comfirm: ((UIAlertAction)-> Void)?){
        let alertC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertC.addAction(UIAlertAction(title: "取消", style: .cancel, handler: comfirm))
        
        alertC.addAction(UIAlertAction(title: actionTitle, style: .default, handler: comfirm))
        
//        alertC.addAction(UIAlertAction.init(title: <#T##String?#>, style: <#T##UIAlertAction.Style#>, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>))
        
        viewController.present(alertC, animated: animated, completion: nil)
       }
    
}
