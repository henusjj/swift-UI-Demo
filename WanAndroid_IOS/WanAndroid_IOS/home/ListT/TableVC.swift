//
//  TableVC.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/10.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class TableVC: UITableViewController {

//    数据
    var dataList = [String]()
//    处理后的数据，根据首字母进行分组
    var resultDict = [String : [String]]()
//    组头标题数组
    var sectionTitles = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="带索引的UITableView"
//        原始数据
        dataList = ["🐰", "秃子", "鹰酱", "毛熊", "Cat", "棒子", "脚盆鸡", "高卢鸡", "狗大户", "🐫", "沙某", "河马", "Big Dog", "Apple"]
//        数据处理
        createResultDict()
        
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cellid")

    }

//    MARK：数据处理，根据首字母进行分组
/**
            ```
            数据**处理**，根据`首字母`进行分组
            ```
 */
    func createResultDict(){
        for str in dataList {
//            获取首字母
            let firstLetterIndex = str.index(str.startIndex,offsetBy:1)
            
            print(firstLetterIndex)
            print(str[..<firstLetterIndex])
//            print(..<firstLetterIndex)
            var firstLetter = String(str[..<firstLetterIndex])
           print(firstLetter)
            //转成大写字母
             firstLetter = firstletterFromString(str: firstLetter)
            if var values = resultDict[firstLetter] {
                values.append(str)
                resultDict[firstLetter] = values
            } else {
                resultDict[firstLetter] = [str]
            }
                       
            //组头标题
            sectionTitles = [String](resultDict.keys)
            //排序
            sectionTitles = sectionTitles.sorted(by: {$0 < $1})
        }
    }
        //MARK: - 将中文转成大写字母
        func firstletterFromString(str: String) -> String {
            //转变成可变字符串
            let mutableStr = NSMutableString.init(string: str)
            
            //将中文转变成带声调的拼音
            CFStringTransform(mutableStr as CFMutableString, nil, kCFStringTransformToLatin, false)
            
            //去掉声调
            let pyStr = mutableStr.folding(options: .diacriticInsensitive, locale: .current)
            
            //将拼音换成大写
            let PYStr = pyStr.uppercased()
            
            //截取大写首字母
            let index = PYStr.index(PYStr.startIndex, offsetBy: 1)
            let firstStr = PYStr[..<index]
            
            //判断首字母是否为大写
            let uppercaseLetter = "^[A-Z]$"
            let predicateLetter = NSPredicate.init(format: "SELF MATCHES %@", uppercaseLetter)
            
            return String(predicateLetter.evaluate(with: firstStr) ? firstStr : "#")
        }


    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let key = sectionTitles[section]
        guard let values = resultDict[key] else {
            return 0
        }
        return values.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid") as? TableViewCell
        let key = sectionTitles[indexPath.section]
        let values = resultDict[key]

        cell?.fillViewWithData(data: values?[indexPath.row] as Any)
            
        return cell!
    }
    
    
    //MARK: - 行高
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //MARK: - section标题
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    //MARK: - 索引列表
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

