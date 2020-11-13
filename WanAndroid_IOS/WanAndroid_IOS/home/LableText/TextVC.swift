//
//  TextVC.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/9.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class TextVC: UIViewController {
    let scroller = UIScrollView.init();

    
//      懒加载组件
    lazy var lable1:UILabel = {
        let lable1 = UILabel.init(frame: CGRect.init(x: 20, y: 0, width: 300, height: 50));
        lable1.text="i am swift";
//        背景颜色，字体颜色，对齐方式
        lable1.backgroundColor = .gray;
        lable1.textColor = .yellow;
        lable1.textAlignment = .center;
//        文字大小自适应
        lable1.adjustsFontSizeToFitWidth = true;
//        设置最小能接受的缩放比
        lable1.minimumScaleFactor = 0.8;
//        设置行数，0表示行数不限
        lable1.numberOfLines = 0;
//        换行方式，按字母换行
        lable1.lineBreakMode = .byCharWrapping;
//        字体设置： 系统字体30 ，正常，粗体，斜体，个性化字体
        lable1.font = UIFont.systemFont(ofSize: 30);
        lable1.font = UIFont.boldSystemFont(ofSize: 30);
        lable1.font = UIFont.italicSystemFont(ofSize: 30);
        lable1.font = UIFont.init(name: "Zapfino", size: 20);
//        获取系统支持的左右字体名称
//        print(UIFont.familyNames);
//        阴影设置
        lable1.shadowColor = .blue;
        lable1.shadowOffset = CGSize.init(width: 3, height: 3);
        return lable1;
    }();
    
    
//    UITextField
    lazy var textfile:UITextField = {
       let textfile = UITextField.init();
//    边框、背景、字体颜色、字体、边框设置
        textfile.borderStyle = .bezel;
        textfile.backgroundColor = .lightGray;
        textfile.textColor = .blue;
        textfile.font = UIFont.init(name: "Zapfino", size: 10);
        textfile.borderStyle = .roundedRect;
//        提示字符
        textfile.placeholder = "小兔兔喜欢swift";
//        输入密码设置私密
        textfile.isSecureTextEntry = true ;
//        对齐方式
        textfile.contentVerticalAlignment = .center;
        textfile.textAlignment = .left;
//        成为第一响应者，这时候，光标一出现，就在该输入框中
        textfile.becomeFirstResponder();
//        取消第一响应者
        textfile.resignFirstResponder();
//        self.view.endEditing(true);
        
//        添加清除模式()
        textfile.clearButtonMode = .whileEditing;//.UnlessEditing
//        键盘样式
        textfile.keyboardType = .numberPad;
        return textfile
    }();
    
//    UITextView
    lazy var tfview:UITextView = {
        let tfview = UITextView.init();
//      字体设置
        tfview.textAlignment = .left;
        tfview.textColor = .red;
        tfview.font = UIFont.init(name: "GillSans", size: 15);
//        光标颜色
        tfview.tintColor = .green;
//        滚动
        tfview.isScrollEnabled = true;
        tfview.showsVerticalScrollIndicator = true;
        tfview.showsHorizontalScrollIndicator = false;
//        是否可以编辑
        tfview.isEditable = true;
//        内容是否可选
        tfview.isSelectable = true;
//        边框、边框颜色
        tfview.layer.borderWidth = 1;
        tfview.layer.borderColor = UIColor.gray.cgColor;
//        给文中的电话，网址，自动添加链接
        tfview.dataDetectorTypes = .all;
//        键盘样式
        tfview.keyboardType = .default;
        
        return tfview;
    }();
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        scroller.backgroundColor = .white;
        scroller.isUserInteractionEnabled = true;
        scroller.contentSize = CGSize.init(width: SCREEN_WIDTH, height: SCREEN_HEIGH - CGFloat(BarH));
        self.view.addSubview(scroller);
        scroller.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.view);
//            make.bottom.equalTo(self.view).offset(0);
            make.bottom.equalToSuperview().offset(-SafeBottomMargin)
        }
        
        addGestureRecognizerSEL();
        
        scroller.addSubview(lable1);
        
        scroller.addSubview(textfile);
        textfile.snp.makeConstraints { (make) in
            make.top.equalTo(lable1.snp.bottom).offset(10);
            make.left.equalTo(self.view).offset(20);
            make.right.equalTo(self.view).offset(-20);
            make.height.equalTo(50);
        }
        
        scroller.addSubview(tfview);
        tfview.snp.makeConstraints { (make) in
            make.top.equalTo(textfile.snp.bottom).offset(10);
            make.left.equalTo(textfile);
            make.right.equalTo(textfile);
            make.height.equalTo(200);
        }
        
        let feedBackView = FeedBackView()
        feedBackView.feedBackBlockBlock = feedBackBlock
        feedBackView.backgroundColor = UIColor.white
        self.view.addSubview(feedBackView)
        
        feedBackView.snp.makeConstraints { (make) in
            make.top.equalTo(tfview.snp.bottom).offset(10);
            make.left.right.equalTo(tfview);
            make.height.equalTo(200);
        }
    }
    
    
//    添加手势
    func addGestureRecognizerSEL(){
        let guesture = UITapGestureRecognizer.init(target: self, action: #selector(singleTap));
        scroller.addGestureRecognizer(guesture);
    }
    @objc func singleTap(){
        view.endEditing(true);
    }
    
// 输入内容
    func feedBackBlock(tfValue: UITextView) ->Void{
            print("======>\(tfValue.text!)")
        }
}
