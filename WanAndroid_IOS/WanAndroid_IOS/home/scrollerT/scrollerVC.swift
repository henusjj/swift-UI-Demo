//
//  scrollerVC.swift
//  WanAndroid_IOS
//
//  Created by shijingjing on 2020/11/10.
//  Copyright © 2020 henusjj. All rights reserved.
//

import UIKit

class scrollerVC: UIViewController,UIScrollViewDelegate {
    // 滚动视图是一个可以拖动的组件
    var scrollView = UIScrollView()
    //添加一个控制翻页的属性
    var pageControl = UIPageControl()
    
    //添加一个状态属性，来标志页面的滑动状态
    var isPageControlUsed = false
    
    override func viewDidLoad (){
        super.viewDidLoad()
        self.title = "轮播图"
        //获取当前设备的屏幕尺寸信息
        var screenFrame = UIScreen.main.bounds
        let screenWidth = screenFrame.width
        let screenHeight = screenFrame.height
        scrollView.frame = CGRect.init(x: 0, y: CGFloat(NAVIH), width: screenWidth, height: screenHeight-CGFloat(NAVIH))
        
        //设置分页模式，滚动一次就是一页
        scrollView.isPagingEnabled = true
        
        //设置滚动视图的宽度
        scrollView.contentSize = CGSize(width:screenWidth * 2,height:screenHeight - CGFloat(NAVIH))
        
        //设置滚动视图的背景色为白色
        scrollView.backgroundColor = UIColor.white
        
        self.scrollView.showsHorizontalScrollIndicator = false //滚动时是否显示垂
        self.scrollView.showsVerticalScrollIndicator = false //是否加反弹效果
        self.scrollView.bounces = false //滚动条的样式
        
        //设置滚动视图对像的代理为当前类，这样就可以在当前文件中编写方法，以捕捉滚动视图的相关动作
        scrollView.delegate = self
        
        //在创建一个高度常量，做页面控制器对像的高度
        let pcHeight:CGFloat = 50.0
        
        //创建一个区域显示页面控制器对象
        let pcRaect = CGRect(x:0 , y:screenHeight - pcHeight , width:screenWidth , height:pcHeight)
        
        pageControl.frame = pcRaect
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
//        pageControl.backgroundColor = UIColor.gray
        
        //添加监听页面切换的方法
        pageControl.addTarget(self, action: #selector(self.pageControlDidChanged(_ :)) , for: UIControl.Event.valueChanged)
        //创建第一个视图控制器的实例
        let firstContorller = oneViewController.init()
        
        //设置坐标原点的横向值为零
        screenFrame.origin.x = 0
        firstContorller.view.frame = screenFrame
        
        //创建第二个视图控制器的实例
        let secondControler = twoViewController.init()
        screenFrame.origin.x = screenFrame.size.width
        secondControler.view.frame = screenFrame
        
        scrollView.addSubview(firstContorller.view)
        scrollView.addSubview(secondControler.view)
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        
        //加载视图后进行任何其他设置。
    }
    
    @objc func pageControlDidChanged(_ sender:AnyObject)
        
    {
        
        //获取当前页码
        
        let crtPage = (CGFloat)(pageControl.currentPage)
        
        var frame = scrollView.frame
        
        //根据页面控制器对象的目标页码，计算滚动视图在下一页中的显示区域
        
        frame.origin.x = frame.size.width * crtPage
        
        frame.origin.y = 0
        
        //滚动到目标区域
        
        scrollView.scrollRectToVisible(frame,animated:true)
        
        //设置通过页面控制器切换页面
        
        isPageControlUsed = true
        
    }
    
    //创建监听滚动视图滚动事件的代理方法
    
    func scrollViewDidScroll(_ scrollView:UIScrollView){
        
        //通过页面控制器对像切换页面，不执行后面的代码
        
        if(!isPageControlUsed)
        {
                
                let pageWidth = scrollView.frame.size.width
                
                //根据滚动视图的宽度值和横向位移量计算当前的页码
                
                let page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
                
                //设置页面控制器页码
                
                pageControl.currentPage = Int(page)
                
        }
        
    }
    
    //创建监听滚动减速事件的代理方法
    
    func scrollViewDidEndDecelerating(_ scrollView:UIScrollView){
        
        isPageControlUsed = false
        
    }
    
    
}
