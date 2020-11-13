//
//  TableViewCell.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/10.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    lazy var labelTop = { () -> UILabel in
        let label = UILabel.init()
        label.textColor = .red
//        label.text = "订单信息"
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addUI() {
        self.addSubview(self.labelTop)
        self.labelTop.snp.makeConstraints { (make) in
            make.top.leading.equalTo(self).offset(16)
            make.height.equalTo(26)
        }
    }
    
    ///数据填充
    func fillViewWithData(data:Any) {
        self.labelTop.text = data as? String
    }
}
