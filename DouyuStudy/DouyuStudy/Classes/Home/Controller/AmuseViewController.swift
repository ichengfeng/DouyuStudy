//
//  AmuseViewController.swift
//  DouyuStudy
//
//  Created by Podinn on 2019/1/14.
//  Copyright © 2019 Fengzee. All rights reserved.
//

import UIKit

private let kMenuViewH : CGFloat = 200

class AmuseViewController: BaseAnchorViewController {

    // MARK - 懒加载属性
    //懒加载属性
    private lazy var amuseVM = AmuseViewModel()
    private lazy var menuView : AmuseMenuView = {
        let menuView = AmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: kScreenW, height: kMenuViewH)
       return menuView
    }()
}
// MARK - 设置UI界面
extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
    }
}

// MARK - 请求数据
extension AmuseViewController {
    
    override func loadData() {
        baseVM = amuseVM
        amuseVM.loadAmuseData {
            //1、刷新表格
            self.collectionView.reloadData()
            
            //2、调整数据
            var tempGroups = self.amuseVM.anchorGroups
            tempGroups.removeFirst()
            self.menuView.groups = tempGroups
            
            //3、数据请求完毕
            self.loadDataFinished()
        }
    }
}
