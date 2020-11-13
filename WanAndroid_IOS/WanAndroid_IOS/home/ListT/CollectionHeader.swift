//
//  CollectionHeader.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/11.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class CollectionHeader: UICollectionReusableView {
    var titleT = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() -> Void {
        titleT.backgroundColor = .gray
        titleT.textAlignment = .center
        self.addSubview(titleT)
        titleT.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(45)
        }
    }
    
    
}
