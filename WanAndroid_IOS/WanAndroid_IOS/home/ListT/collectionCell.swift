//
//  collectionCell.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/11.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class collectionCell: UICollectionViewCell {
    var titleT = UILabel.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView() -> Void {
        self.contentView.layer.borderColor = UIColor.red.cgColor
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.cornerRadius = 4

        
        titleT.layer.cornerRadius = 4
        titleT.layer.borderColor = UIColor.orange.cgColor
        titleT.layer.borderWidth = 1
        titleT.textAlignment = .center
        self.contentView.addSubview(titleT)
        
        titleT.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)

        }
    }
}
