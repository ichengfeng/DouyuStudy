//
//  RecommendCycleView.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/28.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

private let kCycleCellID = "kCycleCellID"

class RecommendCycleView: UIView {
    //定义属性
    var cycleTime : Timer?
    
    var cycleModels : [CycleModel]? {
        didSet {
            //1、刷新collectionView
            collectionView.reloadData()
            //2、设置pagecontrol个数
            pageControl.numberOfPages = cycleModels?.count ?? 0
            //3、默认滚动到中间某一个位置
            let indexPath = IndexPath(item:(cycleModels?.count ?? 0)*10,section:0)
            collectionView.scrollToItem(at: indexPath, at: .left, animated: false)
            //4、添加定时器
            removeCycleTimer()
            addCycleTimer()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置该控件不随着父控件的拉伸而拉伸
        autoresizingMask = []
        //注册cell
        collectionView.register(UINib(nibName: "CollectionCycleCell", bundle: nil), forCellWithReuseIdentifier: kCycleCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //设置layout
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

extension RecommendCycleView {
    class func recommendCycleView() -> RecommendCycleView {
        return Bundle.main.loadNibNamed("RecommendCycleView", owner: self, options: nil)?.first as! RecommendCycleView
    }
}

extension RecommendCycleView : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.cycleModels?.count ?? 0)*10000;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCycleCellID, for: indexPath) as! CollectionCycleCell
        let cycleModel = cycleModels![indexPath.item%cycleModels!.count]
        cell.cycleModel = cycleModel;
        return cell
    }
    
}

extension RecommendCycleView : UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //1、获取滑动的偏移量
        let offsetX = scrollView.contentOffset.x + scrollView.bounds.width*0.5
        //计算pageControl的currentIndex
        pageControl.currentPage = Int(offsetX/scrollView.bounds.width)%(cycleModels?.count ?? 1)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeCycleTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addCycleTimer()
    }
}

//对定时器的操作方法
extension RecommendCycleView {
    
    private func addCycleTimer() {
        cycleTime = Timer(timeInterval: 3.0, target: self, selector: #selector(self.scrollToNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycleTime!, forMode: RunLoop.Mode.common)
    }
    
    private func removeCycleTimer() {
        cycleTime?.invalidate()//从运行循环中移除
        cycleTime = nil
    }
    
    @objc private func scrollToNext() {
        //1、获取滚动的偏移量
        let currentOffsetX = collectionView.contentOffset.x
        let offsetX = currentOffsetX + collectionView.bounds.width
        //2、滚动到该位置
        collectionView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
    }
    
}
