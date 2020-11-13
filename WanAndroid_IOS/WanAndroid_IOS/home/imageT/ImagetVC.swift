//
//  ImagetVC.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/10.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class ImagetVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let imageview = UIImageView.init(image: UIImage.init(named: "mine_bg_for_boy"))
//        获取文件目录中的图片
//        let path = Bundle.main.path(forResource: "gril", ofType: "png")
//        let newimage = UIImage.init(contentsOfFile: path!);
        
        //MARK :网络获取图片会卡顿，此处需要开辟线程
        
//        网络地址获取图片
        let url = URL.init(string: "http://image.cnpp.cn/upload/images/20160905/09380421552_400x300.jpg")
        var smallimage = UIImage.init()
        let downimage = DispatchWorkItem {
            let data = try! Data.init(contentsOf: url!)
            smallimage = UIImage.init(data: data)!
        }
        
//        开辟线程
        let quen = DispatchQueue.global()
        quen.async(execute: downimage)
        let imageview1 = UIImageView.init()
        downimage.notify(queue: DispatchQueue.main) {
            imageview1.image = smallimage
        }
        self.view.addSubview(imageview1)

        self.view.addSubview(imageview)
        imageview.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(NAVIH+10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(100);
        }
        
        imageview1.snp.makeConstraints { (make) in
            make.top.equalTo(imageview.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(100);
        }
        
//        分组图片轮展
        let imageview2 = UIImageView.init()
        imageview2.animationImages = [UIImage.init(named: "mine_bg_for_boy")!,UIImage.init(named: "mine_bg_for_girl")!]
//            [UIImage(named: "mine_bg_for_boy")]
//        所有图片展示完一遍的总时长
        imageview2.animationDuration = 2
//        开始
        imageview2.startAnimating()
        
        self.view.addSubview(imageview2)
        imageview2.snp.makeConstraints { (make) in
            make.top.equalTo(imageview1.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(100);
        }
    }
    
}
