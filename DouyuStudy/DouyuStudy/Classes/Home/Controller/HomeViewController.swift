//
//  HomeViewController.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/20.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40;



class HomeViewController: UIViewController {
    
    private lazy var pageTitleView : PageTitleView = {[weak self] in
        //kNavigationBarH+kStatusBarH
        let h : CGFloat = (self?.navigationController?.navigationBar.frame.maxY)!
        let titleFrame = CGRect(x: 0, y: h , width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView;
    }()
    
    private lazy var pageContentView : PageContentView = {[weak self] in
        let h : CGFloat = (self?.navigationController?.navigationBar.frame.maxY)!
        let tabbarH : CGFloat = (self?.tabBarController?.tabBar.frame.height)!
    
        //1.确定内容的frame
        let contentFrame = CGRect(x: 0, y: h+kTitleViewH, width: kScreenW, height: kScreenH-h-kTitleViewH-tabbarH)
        
        //2.确定所有的自控制器
        var childVcs = [UIViewController]()
        childVcs.append(RecommendViewController())
        for _ in 0..<3 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let contentView = PageContentView(frame: contentFrame, childVcs: childVcs, parentViewController: self)
        contentView.delegate = self
        return contentView
    }()
    
    //系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置UI界面
        setupUI()
    }
}


// MARK: - 设置UI界面
extension HomeViewController {
    private func setupUI() {
        //1、设置导航栏
        setupNavagationBar()
        
        //2、添加titleView
        view.addSubview(pageTitleView)
        
        //3、添加contentView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.gray
        
    }
    
    private func setupNavagationBar() {
        //1.设置左侧的item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        //2.设置右侧的item
        let size = CGSize(width: 40, height: 40)
        //历史，查询，二维码扫描
        let historyItem = UIBarButtonItem(imageName: "image_my_history", hightImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", hightImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", hightImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
    }
  
}

// MARK: - 遵守PageTitleViewDelegate
extension HomeViewController :PageTitleViewDelegate {
    func pageTitleView(titleView: PageTitleView, selectIndex index: Int) {
        pageContentView.setCurrentIndex(currentIndex: index)
    }
}

// MARK: - 遵守PageContentViewDelegate
extension HomeViewController : PageContentViewDelegate {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleWithProgress(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}
