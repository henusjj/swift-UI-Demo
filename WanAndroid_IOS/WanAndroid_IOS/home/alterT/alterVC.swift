//
//  alterVC.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/10.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class alterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let btn1 = UIButton.init(type: UIButton.ButtonType.custom)
        btn1.setTitle("普通提示框", for: .normal)
        btn1.setTitleColor(.blue, for: .normal)
        btn1.tag = 1
        btn1.addTarget(self, action: #selector(btnclick(_:)), for: .touchUpInside)
        self.view.addSubview(btn1)
        btn1.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(NAVIH+20)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        let btn2 = UIButton.init(type: UIButton.ButtonType.custom)
        btn2.setTitle("类似删除操作提示框", for: .normal)
        btn2.setTitleColor(.blue, for: .normal)
        btn2.tag = 2
        btn2.addTarget(self, action: #selector(btnclick(_:)), for: .touchUpInside)
        self.view.addSubview(btn2)
        btn2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(btn1.snp.bottom).offset(20)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        let btn3 = UIButton.init(type: UIButton.ButtonType.custom)
        btn3.setTitle("带一个textfile", for: .normal)
        btn3.setTitleColor(.blue, for: .normal)
        btn3.tag = 3
        btn3.addTarget(self, action: #selector(btnclick(_:)), for: .touchUpInside)
        self.view.addSubview(btn3)
        btn3.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(btn2.snp.bottom).offset(20)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        let btn4 = UIButton.init(type: UIButton.ButtonType.custom)
        btn4.setTitle("带两个textField的提示框", for: .normal)
        btn4.setTitleColor(.blue, for: .normal)
        btn4.tag = 4
        btn4.addTarget(self, action: #selector(btnclick(_:)), for: .touchUpInside)
        self.view.addSubview(btn4)
        btn4.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(btn3.snp.bottom).offset(20)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        let btn5 = UIButton.init(type: UIButton.ButtonType.custom)
        btn5.setTitle("提示框弹出后自动消失", for: .normal)
        btn5.setTitleColor(.blue, for: .normal)
        btn5.tag = 5
        btn5.addTarget(self, action: #selector(btnclick(_:)), for: .touchUpInside)
        self.view.addSubview(btn5)
        btn5.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(btn4.snp.bottom).offset(20)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        let btn6 = UIButton.init(type: UIButton.ButtonType.custom)
        btn6.setTitle("ActionSheet", for: .normal)
        btn6.setTitleColor(.blue, for: .normal)
        btn6.tag = 6
        btn6.addTarget(self, action: #selector(btnclick(_:)), for: .touchUpInside)
        self.view.addSubview(btn6)
        btn6.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(btn5.snp.bottom).offset(20)
            make.width.equalTo(250)
            make.height.equalTo(50)
        }
        
        
//        /使用封装的alter扩展方法
        UIAlertController.showAlertComfirm(title: "扩展", message: "扩展+回调", actionTitle: "ok", animated: true, in: self) { (action) in
            UIAlertController.showAlter(title: "扩展", message: "扩展的基本方法", actionTile: "确定", animated: true, viewController: self)
        }
    }
    

    @objc func btnclick(_ sender: Any) {
        let btn = sender as! UIButton
        
        if  btn.tag == 1{
            let alertC = UIAlertController.init(title: "温馨提示", message: "现在开始走运了", preferredStyle: .alert)

            alertC.addAction(UIAlertAction.init(title: "好的", style: .default, handler: nil))

            present(alertC, animated: true, completion: nil)
        }else if btn.tag == 2 {
            let alterC = UIAlertController.init(title: "温馨提示", message: "确定删除bug吗？", preferredStyle: .alert)
            alterC.addAction(UIAlertAction.init(title: "删除", style: .destructive, handler: { (action) in
                
            }))
            
            alterC.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
            
            present(alterC, animated: true, completion: nil)
        }else if btn.tag == 3{
            let alterC = UIAlertController.init(title: "添加数据", message: nil, preferredStyle: .alert)
            alterC.addTextField { (textfile) in
                textfile.placeholder = "请输入数字"
                textfile.keyboardType = .namePhonePad
                
            }
            alterC.addAction(UIAlertAction.init(title: "确定", style: .default, handler: { (action) in
                let text = alterC.textFields?.first?.text
                print(text as Any)
                
            }))
            present(alterC, animated: true, completion: nil)
        }else if btn.tag == 4{
            let alertC = UIAlertController.init(title: "登录", message: nil, preferredStyle: .alert)
                    
            //添加textField
            alertC.addTextField { (textField) in
                //这里对textField进行设置
                textField.placeholder = "输入帐号"
            }

            alertC.addTextField { (textField) in
                //这里对textField进行设置
                textField.placeholder = "输入密码"
                textField.isSecureTextEntry = true//密文显示
            }

            alertC.addAction(UIAlertAction.init(title: "登录", style: .default, handler: { (action) in
                //这里获取textField的内容进行操作
                //输入的帐号
                let text1 = (alertC.textFields?.first)!.text!

                //输入的密码
                let text2 = (alertC.textFields?.last)!.text!

                print("帐号：\(text1)\n密码：\(text2)")

            }))

            alertC.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))

            present(alertC, animated: true, completion: nil)
        }else if btn.tag == 5{
            let alertC = UIAlertController.init(title: "成功", message: nil, preferredStyle: .alert)
                    
            present(alertC, animated: true, completion: nil)

            //3秒后提示框消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                //提示框消失
                alertC.dismiss(animated: true, completion: nil)
            }
        }else if btn.tag == 6{
//
            let alertC = UIAlertController.init(title: "温馨提示", message: "你准备好了吗？", preferredStyle: .actionSheet)
                    
            alertC.addAction(UIAlertAction.init(title: "准备好了", style: .destructive, handler: { (action) in
                print("万事俱备")
            }))
            alertC.addAction(UIAlertAction.init(title: "还差一点点", style: .destructive, handler: { (action) in
                print("万事俱备")
            }))
            alertC.addAction(UIAlertAction.init(title: "完全ok", style: .default, handler: { (action) in
                print("万事俱备")
            }))

            alertC.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))

            present(alertC, animated: true, completion: nil)
        }
        
    }
    
//
    
    
    
}
