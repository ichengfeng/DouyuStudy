//
//  RecommendViewController.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/21.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90

class RecommendViewController: BaseAnchorViewController {

    //懒加载属性
    private lazy var recommendVM = RecommendViewModel()
    
    private lazy var cycleView : RecommendCycleView = {
        let cycleView = RecommendCycleView.recommendCycleView()
        cycleView.frame = CGRect(x: 0, y: -(kCycleViewH + kGameViewH), width: collectionView.frame.width, height: kCycleViewH)
        
        return cycleView
    }()
    private lazy var gameView : RecommendGameView = {
       let gameView = RecommendGameView.recommendGameView()
        gameView.frame = CGRect(x: 0, y: -kGameViewH, width: collectionView.frame.width, height: kGameViewH)
        return gameView
    }()
   
}

// MARK: - 设置UI界面
extension RecommendViewController {
    override func setupUI() {
        super.setupUI()
        
        //1、将UICollectionView添加到控制器的View中
        view.addSubview(collectionView)
        
        //2、将CycleView添加到UICollectionView中
        collectionView.addSubview(cycleView)
        
        //3、将gameview添加到collectionView
        collectionView.addSubview(gameView)
        
        //4、设置collectionView的内边距
        collectionView.contentInset = UIEdgeInsets(top: kCycleViewH+kGameViewH, left: 0, bottom: 0, right: 0)
    }
}

extension RecommendViewController {
    
    override func loadData() {
        //0、给父类中的viewModel进行赋值
        baseVM = recommendVM
        
        //1、请求推荐数据
        recommendVM.requestData {
            //1.1、展示推荐数据
            self.collectionView.reloadData()
            //1.2、将数据传递给gameView
            var groups = self.recommendVM.anchorGroups
            
            //1.3、移除前两组数据
            groups.removeFirst()
            groups.removeFirst()
            //1.4添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups.append(moreGroup)
            
            self.gameView.groups = groups
            
            //1.5数据请求完毕
            self.loadDataFinished()
        }
        
        //2、请求轮播数据
        recommendVM.requestCycleData {
            self.cycleView.cycleModels = self.recommendVM.cycleModels
        }
    }
    
}

extension RecommendViewController : UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            //1、取出prettyCell
            let prettyCell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath) as! CollectionPrettyCell
            //2、设置数据
            prettyCell.anchor = recommendVM.anchorGroups[indexPath.section].anchors[indexPath.item]
            return prettyCell
        } else {
            return super.collectionView(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: kNormalItemW, height: kPrettyItemH)
        }
        return CGSize(width: kNormalItemW, height: kNormalItemH)
    }
}
