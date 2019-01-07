//
//  RecommendGameView.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/29.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

private let kGameCellID = "kGameCellID"
class RecommendGameView: UIView {
    //定义数据的属性
    var groups : [AnchorGroup]? {
        didSet {
            //移除前两组数据
            groups?.removeFirst()
//            groups?.removeFirst()
            //添加更多组
            let moreGroup = AnchorGroup()
            moreGroup.tag_name = "更多"
            groups?.append(moreGroup)
            
            collectionView.reloadData()
        }
    }
    
    //控件属性
    @IBOutlet weak var collectionView: UICollectionView!
    //系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        //让控件不随着父视图的拉伸改变而改变
        autoresizingMask = []

        collectionView.register(UINib(nibName: "CollectionGameCell", bundle: nil), forCellWithReuseIdentifier: kGameCellID)
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

//提供快速创建的类方法
extension RecommendGameView{
    class func recommendGameView() -> RecommendGameView{
    return Bundle.main.loadNibNamed("RecommendGameView", owner: self, options: nil)?.first as! RecommendGameView
    }
}

//遵守UICollectionView的数据协议
extension RecommendGameView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kGameCellID, for: indexPath) as! CollectionGameCell
        let group = groups![indexPath.item]
        cell.group = group
        return cell;
    }
    
    
}
