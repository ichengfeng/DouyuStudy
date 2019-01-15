//
//  FunnyViewController.swift
//  DouyuStudy
//
//  Created by Podinn on 2019/1/15.
//  Copyright © 2019 Fengzee. All rights reserved.
//

import UIKit

private let kTopMargin : CGFloat = 8;

class FunnyViewController: BaseAnchorViewController {
    // MARK - 懒加载viewmodel对象
    fileprivate lazy var funnyVM : FunnyViewModel = FunnyViewModel()
}

extension FunnyViewController {
    override func setupUI() {
        super.setupUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        collectionView.contentInset = UIEdgeInsets(top: kTopMargin, left: 0, bottom: 0, right: 0)
    }
    
    override func loadData() {
        //1、给父类中的viewmodel进行赋值
        baseVM = funnyVM
        
        //2、请求数据
        funnyVM.loadFunnyData {
            self.collectionView.reloadData()
            
            //数据请求完毕
            self.loadDataFinished()
        }
        
    }
}
