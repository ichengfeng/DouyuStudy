//
//  RecommendViewModel.swift
//  DouyuStudy
//
//  Created by chengfeng on 2018/12/23.
//  Copyright © 2018 Fengzee. All rights reserved.
//
/*
 1.请求数据，并转换成模型对象
 2.对数据进行排序
 3.显示的headerView中内容
 */
import UIKit

class RecommendViewModel : BaseViewModel {
    //懒加载属性
    lazy var cycleModels : [CycleModel] = [CycleModel]()
    private lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    private lazy var prettyGroup : AnchorGroup = AnchorGroup()
    
}

//发送网络请求
extension RecommendViewModel {
    func requestData(finishCallBack : @escaping () -> ()) {
        //0.定义参数
        let parameters = ["limit":"4","offset":"0","time":NSDate.getCurrentTime()]
        let dGroup = DispatchGroup.init()
        
        //1.请求第一部分推荐数据
        dGroup.enter()
        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: parameters) { (result) in
            //1.1 将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else {return}
            //1.2 根据data，获取数组
            guard let dataArray = resultDict["data"] as? [[String:NSObject]] else {return}
            
            //1.3 遍历字典，转成模型对象
            //1.3.1 设置组的书序
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.small_icon_url = "home_header_hot"
            
            //1.3.2获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.bigDataGroup.anchors.append(anchor)
            }
            dGroup.leave()
        }
        
        //2.请求第二部分颜值数据
        dGroup.enter()
        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: parameters) { (result) in
            //2.1 将result转成字典类型
            guard let resultDict = result as? [String : NSObject] else {return}
            //2.2 根据data，获取数组
            guard let dataArray = resultDict["data"] as? [[String:NSObject]] else {return}
            //2.3 遍历字典，转成模型对象
            //2.3.1 设置组的书序
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.small_icon_url = "home_header_phone"
            
            //2.3.2获取主播数据
            for dict in dataArray {
                let anchor = AnchorModel(dict: dict)
                self.prettyGroup.anchors.append(anchor)
            }
            dGroup.leave()
        }
        
        //3.请求后面部分游戏数据
        dGroup.enter()
        loadAnchorData(isGroupData:true, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameteres: parameters) {
            dGroup.leave()
        }
//        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: parameters) { (result) in
//
//            //3.1、将result转成字典类型
//            guard let resultDict = result as? [String : NSObject] else {return}
//
//            //3.2、根据data的key，获取数组
//            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else {return}
//
//            //3.3遍历数组，获取字典，并且将字典转成模型对象
//            for dict in dataArray {
//
//                let group = AnchorGroup(dict: dict)
//                self.anchorGroups.append(group)
//
//            }
//            dGroup.leave()
//        }
        
        dGroup.notify(queue:DispatchQueue.main) {
            self.anchorGroups.insert(self.prettyGroup, at: 0)
            self.anchorGroups.insert(self.bigDataGroup, at: 0)
            
            finishCallBack()
        }
        
    }

    func requestCycleData(finishCallBack : @escaping () -> ()) {
        NetWorkTools.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version":"2.300"]) { (result) in
            //1、获取整体字典数据
            guard let resultDict = result as? [String:NSObject] else {return}
            //2、根据data的key获取数据
            guard let dataArray = resultDict["data"] as? [[String:NSObject]] else {return}
            //字典转换成对象
            for dict in dataArray {
               self.cycleModels.append(CycleModel(dict: dict))
            }
            
            finishCallBack()
        }
    }
}
