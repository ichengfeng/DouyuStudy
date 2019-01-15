//
//  GameViewController.swift
//  DouyuStudy
//
//  Created by Podinn on 2019/1/8.
//  Copyright © 2019 Fengzee. All rights reserved.
//

import UIKit

private let kEdgeMargin : CGFloat = 10
private let kItemW : CGFloat = (kScreenW - 2*kEdgeMargin)/3
private let kItemH : CGFloat = kItemW
private let kHeaderH : CGFloat = 50
private let kGameViewH : CGFloat = 90

private let kGameHeaderID = "kGameHeaderID"
private let kGameCellID = "kGameCellID"
class GameViewController: BaseViewController {

    // MARK - 懒加载属性
    fileprivate lazy var gameVM : GameViewModel = GameViewModel()
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        //1、创建布局
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: kEdgeMargin, bottom: 0, right: kEdgeMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderH)
        
        //2、创建collectionView
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: kGameHeaderID)
        
        return collectionView
    }()
    fileprivate lazy var topHeaderView : CollectionHeaderView = {
        let headerView = CollectionHeaderView.collectionHeaderView()
        headerView.frame = CGRect(x: 0, y: -(kHeaderH+kGameViewH), width: kScreenW, height: kHeaderH)
        headerView.titleLabel.text = "常用"
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.moreButton.isHidden = true
        return headerView
    }()
    fileprivate lazy var gameView : RecommendGameView = {
        let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: kScreenW, height: kGameViewH)
        return gameView
    }()
    
    // MARK - 系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }

}
// MARK - 设置UI界面
extension GameViewController {
    
    override func setupUI() {
        contentView = collectionView
        //1、添加UICollectionView
        view.addSubview(collectionView)
        //2、添加顶部的HeaderView
        collectionView.addSubview(topHeaderView)
        //3、将常用游戏的view添加到collectionview
        collectionView.addSubview(gameView)
        //设置collectionView内边距
        collectionView.contentInset = UIEdgeInsets(top: kHeaderH+kGameViewH, left: 0, bottom: 0, right: 0)
        
        super.setupUI()
        
    }
}

// MARK - 加载数据
extension GameViewController {
    fileprivate func loadData() {
        gameVM.loadAllGameData {
            //1、展示全部游戏
            self.collectionView.reloadData()
            
            //2、展示常用游戏
            self.gameView.groups = Array(self.gameVM.games[0..<10])
            
            //3、数据请求完毕
            self.loadDataFinished()
        }
    }
}

// MARK - 遵守 UICollectionViewDataSource 协议
extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameVM.games.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1、获取cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        cell.baseGame = gameVM.games[indexPath.item]
        return cell;
    }
 
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       //1、取出headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kGameHeaderID, for: indexPath) as!CollectionHeaderView
        
        //给headerView设置属性
        headerView.titleLabel.text = "全部"
        headerView.iconImageView.image = UIImage(named: "Img_orange")
        headerView.moreButton.isHidden = true
        return headerView
    }
}
