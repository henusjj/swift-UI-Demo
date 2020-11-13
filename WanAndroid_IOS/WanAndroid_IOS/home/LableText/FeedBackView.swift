//
//  FeedBackView.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/9.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class FeedBackView: UIView,UITextViewDelegate {

    
    typealias FeedBackBlock = (_ tfVlaue: UITextView) -> Void
    
    var feedBackBlockBlock:FeedBackBlock?
    
    
    // UITextView
    var textView: UITextView?
    // 反馈字符限制
    var limitLabT: UILabel?
    // 占位符
    // MARK: - 懒加载
    private lazy var placeholderLabel: UILabel =
    {
        let lb = UILabel()
        lb.textColor = UIColor.lightGray
        lb.text = "请简要明确的描述您的意见和建议"
        lb.font = textView?.font
        return lb
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
       self.setUpUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:设置UI
    func setUpUI() -> Void{
        
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        let textView = UITextView()
        textView.delegate = self
        textView.tintColor = UIColor.red
        textView.font = UIFont.systemFont(ofSize: 12 )
        textView.textAlignment = .left
        textView.contentInset = .init(top: 0, left: 0, bottom: 60 , right: 0)
        //可以滚动
        textView.isScrollEnabled = true
        //自适应高度
        textView.autoresizingMask = .flexibleHeight
        self.addSubview(textView)
        self.textView = textView
        
        let limitLabT = UILabel()
        limitLabT.text = "0/100"
        limitLabT.font = UIFont.systemFont(ofSize: 12 )
        limitLabT.textColor = .black
        limitLabT.textAlignment = .right
        self.addSubview(limitLabT)
        limitLabT.sizeToFit()
        self.limitLabT = limitLabT
        
        self.textView?.addSubview(self.placeholderLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        textView?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(1)
            make.left.equalToSuperview().offset(1)
            make.right.equalToSuperview().offset(1)
            make.bottom.equalTo(-22 )
        })
       
       limitLabT?.snp.makeConstraints({ (make) in
          make.bottom.equalToSuperview().offset(-10 )
          make.right.equalToSuperview().offset(-8 )
          make.width.equalTo(100 )
       })
      
        placeholderLabel.snp.makeConstraints { (make) in
            make.top.equalTo(8 )
            make.left.equalTo(8 )
        }
    }
    
   // MARK: -TextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        
        // 实时显示字数
        self.limitLabT!.text = "\(textView.text.count)/100"
        // 字数限制
        if textView.text.count >= 100 {
            textView.text  = String(textView.text.prefix(99))
       }
        // 占位符隐藏
        placeholderLabel.isHidden = textView.text.count == 0 ?false:true
        
        self.feedBackBlockBlock!(textView)
        
    }
 
}
