//
//  homeVC.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/6.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class homeVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
//    tableview
    var tableview = UITableView.init();
//    数据
    var dataList:NSMutableArray = [];
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="主页";
        self.view.backgroundColor = .white;
        self.navigationItem.rightBarButtonItem=UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editAction))
//        数据
        dataList = NSMutableArray.init(array: ["lableT","buttonT","imageT","tablecell","collectioncell","scroller","alterT","other"]);
//        UI
        creatTableViewUI();
        
        
    }
    
//   编辑action
   @objc func editAction(){
    tableview.setEditing(true, animated: true);
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(doneAction));
    }
   
//  编辑完成
    @objc func doneAction(){
        tableview.setEditing(false, animated: true);
//        右上角编辑按钮
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(editAction));
    }
    
//    UI
    func creatTableViewUI() {
        tableview = UITableView.init(frame: UIScreen.main.bounds,style: .plain);
        tableview.delegate=self;
        tableview.dataSource=self;
//        注册cell
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellID");
        self.view.addSubview(tableview);
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath);
        cell.textLabel?.text = dataList[indexPath.row] as? String;
        return cell;
        
    }
    
//    行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
//    点击cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.navigationController?.pushViewController(TextVC.init(), animated: true)
        }else if indexPath.row == 1{
            self.navigationController?.pushViewController(button.init(), animated: true)
        }else if indexPath.row == 2{
            self.navigationController?.pushViewController(ImagetVC.init(), animated: true)
        }else if indexPath.row == 3{
            self.navigationController?.pushViewController(TableVC.init(), animated: true)
        }else if indexPath.row == 5{
            self.navigationController?.pushViewController(scrollerVC.init(), animated: true)
        }else if indexPath.row == 4{
            self.navigationController?.pushViewController(collectionVC.init(), animated: true)
        }else if indexPath.row == 6{
            self.navigationController?.pushViewController(alterVC.init(), animated: true)
        }else{
            self.navigationController?.pushViewController(otherViewController.init(), animated: true)

        }
        
    }
}
