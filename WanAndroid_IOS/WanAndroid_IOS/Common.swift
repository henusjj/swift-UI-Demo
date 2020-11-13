//
//  Common.swift
//  SwiftTest
//
//  Created by GuoYanjun on 2018/12/26.
//  Copyright © 2018年 shiyujin. All rights reserved.
//

import Foundation
import UIKit

//这是第三方库需要导入的头文件，自己创建.swift的不需要导入import CYLTabBarController
//import CYLTabBarController


import SnapKit

import Alamofire

//

//获取屏幕宽度  高度
let  SCREEN_WIDTH = UIScreen.main.bounds.width
let  SCREEN_HEIGH = UIScreen.main.bounds.height


let SCREEN_HEIGHT = max(SCREEN_HEIGH, SCREEN_WIDTH)
func font(font:CGFloat) -> CGFloat {
   return font * SCREEN_HEIGHT / 667.0
}

//iPhoneX、11系列
func LL_iPhoneX() -> Bool {
    if SCREEN_WIDTH >= 375 && SCREEN_HEIGHT >= 812 {
        return true
    }else{
        return false
    }
}

//#define NAVIH (LL_iPhoneX ? 88.f : 64.f)
let NAVIH = LL_iPhoneX() ? 88 : 64

//#define barH (LL_iPhoneX ? (49.f+34.f) : 49.f)
let BarH = LL_iPhoneX() ? (49+34) : 49

//下面安全区域的高度
//#define  SafeBottomMargin         (LL_iPhoneX ? 34.f : 0.f)
let SafeBottomMargin = LL_iPhoneX() ? 34 : 0

//根据ip6的屏幕来拉伸
//#define Scale(with) ((with)*(ScreenWidth/375.0f))
func ScaleW(with:CGFloat) -> CGFloat {
    return with * SCREEN_WIDTH / 375.0
}

//#define pixh(p)   (LL_iPhoneX ? p:(SafeSCREEN_HEIGHT)/667.0*p)
func ScaleH(height:CGFloat) -> CGFloat {
    if LL_iPhoneX() {
        return ScaleW(with: height)
    }else{
        return (SCREEN_HEIGH - 34) / 667 * height
    }
}

//颜色获取(定义方法)
func RGBA(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

