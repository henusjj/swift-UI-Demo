//
//  btn.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/9.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class button: UIViewController {

//    button
    func creatbtn() -> UIButton {
        let btn=UIButton.init()
//        按钮文字设置
        btn.setTitle("普通状态", for:.normal) //普通状态下的文字
        btn.setTitle("触摸状态", for:.highlighted) //触摸状态下的文字
        btn.setTitle("禁用状态", for:.disabled) //禁用状态下的文字
//        按钮文字颜色
        btn.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        btn.setTitleColor(UIColor.green, for: .highlighted) //触摸状态下文字的颜色
        btn.setTitleColor(UIColor.gray, for: .disabled) //禁用状态下文字的颜色
//        按钮文字阴影
        btn.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        btn.setTitleShadowColor(UIColor.yellow, for:.highlighted) //触摸状态下文字阴影的颜色
        btn.setTitleShadowColor(UIColor.gray, for:.disabled) //禁用状态下文字阴影的颜色
        
//        按钮文字大小设置
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        设置边框，宽度，圆角
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.layer.borderWidth = 0.5
        btn.layer.cornerRadius = 10
        
//        按钮文字图标
        btn.setImage(UIImage(named:"all_v_avatar_star_16x16_"),for: .normal)  //设置图标
        btn.adjustsImageWhenHighlighted=false //使触摸模式下按钮也不会变暗（半透明）
        btn.adjustsImageWhenDisabled=false //使禁用模式下按钮也不会变暗（半透明）
        
//        偏移量，分别为上下左右
//        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        btn.addTarget(self, action: #selector(tapped(_ :)), for: .touchUpInside)
        
        return btn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let btn1 = self.creatbtn();
        btn1.layoutButton(style: .Left,imageTitleSpace:5)
        self.view.addSubview(btn1);
        btn1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(NAVIH+10)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        let btn2 = self.creatbtn();
        btn2.layoutButton(style: .Right,imageTitleSpace: 5)
        self.view.addSubview(btn2);
        btn2.snp.makeConstraints { (make) in
            make.top.equalTo(btn1.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        let btn3 = self.creatbtn();
        btn3.layoutButton(style: .Top,imageTitleSpace: 5)
        self.view.addSubview(btn3);
        btn3.snp.makeConstraints { (make) in
            make.top.equalTo(btn2.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        let btn4 = self.creatbtn();
        btn4.layoutButton(style: .Bottom,imageTitleSpace: 5)
        self.view.addSubview(btn4);
        btn4.snp.makeConstraints { (make) in
            make.top.equalTo(btn3.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
    }
    
    @objc func tapped(_ button:UIButton){
                print("ok")
           }

    
    
    
}


//MARK: -定义button相对label的位置
enum YWButtonEdgeInsetsStyle {
    case Top
    case Left
    case Right
    case Bottom
}

extension UIButton {
// imageTitleSpace：图片和文字之间的距离
    func layoutButton(style: YWButtonEdgeInsetsStyle, imageTitleSpace: CGFloat) {
        //得到imageView和titleLabel的宽高
        let imageWidth = self.imageView?.intrinsicContentSize.width
        let imageHeight = self.imageView?.intrinsicContentSize.height
        
        var labelWidth: CGFloat! = 0.0
        var labelHeight: CGFloat! = 0.0

        labelWidth = self.titleLabel?.intrinsicContentSize.width
        labelHeight = self.titleLabel?.intrinsicContentSize.height
        
//        let font:UIFont! = UIFont.systemFont(ofSize: 15.0)
//        let attributes = [NSAttributedString.Key.font:font]
//        let option = NSStringDrawingOptions.usesLineFragmentOrigin
//
//        let rects:CGRect = (self.titleLabel?.text?.boundingRect(with: CGSize.init(width: 200, height: 300), options: option, attributes: attributes as [NSAttributedString.Key : Any], context: nil))!
//
//
//        print(rects.width)
//        print(labelWidth!)
        
        //初始化imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero
        var labelEdgeInsets = UIEdgeInsets.zero
        
        //根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
            case .Top:
                //上 左 下 右
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth*0.5, bottom: labelHeight+imageTitleSpace*2, right: -labelWidth/2)
                labelEdgeInsets = UIEdgeInsets(top: labelHeight+imageTitleSpace*2, left: -imageWidth!, bottom: 0, right: 0)
                break;
                
            case .Left:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleSpace, bottom: 0, right: 0)
//                labelEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpace/2, bottom: 0, right: -imageTitleSpace/2)
                break;
                
            case .Bottom:
                imageEdgeInsets = UIEdgeInsets(top: imageHeight!*0.5 + imageTitleSpace*0.5, left: labelWidth/2, bottom: -imageHeight!-imageTitleSpace/2, right: -labelWidth/2)
                labelEdgeInsets = UIEdgeInsets(top: -labelHeight!/2-imageTitleSpace/2, left: -imageWidth!/2, bottom: labelHeight/2+imageTitleSpace/2, right: imageWidth!/2)
                break;
                
            case .Right:
                imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+imageTitleSpace, bottom: 0, right: -labelWidth-imageTitleSpace)
                labelEdgeInsets = UIEdgeInsets(top: 0, left: -(imageWidth!+imageTitleSpace), bottom: 0, right: imageWidth!+imageTitleSpace)
//                print(imageWidth);
                break;
                
        }
        
        self.titleEdgeInsets = labelEdgeInsets
        self.imageEdgeInsets = imageEdgeInsets
        
    }
}
