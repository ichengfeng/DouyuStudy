//
//  PageContentView.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/20.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {

    private var childVcs : [UIViewController]
    private var parentViewController : UIViewController
    
    private lazy var collectionView : UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self;
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        
        return collectionView
    }()
    
    init(frame: CGRect, childVcs : [UIViewController], parentViewController : UIViewController) {
        
        self.childVcs = childVcs
        self.parentViewController = parentViewController;
        
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not benn implemented")
    }

}


// MARK: - 设置UI界面
extension PageContentView {
    private func setupUI() {
        //1、将所有的自控制器添加父控制器中
        for childVc in childVcs {
            parentViewController.addChild(childVc)
        }
        //2、添加UICollectionView,用于在cell中存放控制器的view
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

extension PageContentView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return childVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //1、创建Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        //2、给cell设置内容
        let childVC = childVcs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        return cell
    }
    
}
