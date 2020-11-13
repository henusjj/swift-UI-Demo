//
//  cllectionVC.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/10.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class collectionVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionview : UICollectionView?
    var dataArr = NSMutableArray.init();
    let w = SCREEN_WIDTH
    let h = SCREEN_HEIGH
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "collection"
        self.view.backgroundColor = .white
        initView()
    }
    
    func initView() -> Void {
        let layout = UICollectionViewFlowLayout.init()
        collectionview = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: w, height: h), collectionViewLayout: layout)
//        注册一个cell
        collectionview?.register(collectionCell.self, forCellWithReuseIdentifier: "ccell")
        collectionview?.delegate=self
        collectionview?.dataSource=self
        collectionview?.backgroundColor = .white
      
//        设置每一个cell 的宽高
        layout.itemSize = CGSize.init(width: (w-30)/3, height: 50)
        layout.minimumInteritemSpacing = 5
//        设置行间距
        layout.minimumLineSpacing = 10
        
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
//        注册header
        collectionview?.register(CollectionHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "cheader")
        
        self.view.addSubview(collectionview!)
        
        getData()
    }
    
    func getData() -> Void {
        dataArr.add("Ios")
        dataArr.add("Swift")
        dataArr.add("Java")
        dataArr.add("Web")
        dataArr.add("Flutter")
    }
    
//    实现代理方法
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as! collectionCell
        
        cell.titleT.text = dataArr[indexPath.row] as? String
        return cell
    }
//    设置footer高--写了之后必须有footerview，不然会报错 ，kind 会有两个判断值
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize.init(width: SCREEN_WIDTH, height: 0.01)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: SCREEN_WIDTH, height: 60)

    }
//    返回自定义Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var header = CollectionHeader.init()
        if kind == UICollectionView.elementKindSectionHeader{
            header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "cheader", for: indexPath) as! CollectionHeader
            header.titleT.text = (dataArr[indexPath.section] as! String)

        }
        return header

//        else{
//            var footer = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 0.01))
//            footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath) as UIView
//            return footer as! UICollectionReusableView
//        }
//        return TID_NULL as UICollectionReusableView
    }

}
