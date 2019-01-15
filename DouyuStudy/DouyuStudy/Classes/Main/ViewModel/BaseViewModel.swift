//
//  BaseViewModel.swift
//  DouyuStudy
//
//  Created by Podinn on 2019/1/14.
//  Copyright © 2019 Fengzee. All rights reserved.
//

import UIKit

class BaseViewModel: NSObject {
    lazy var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel {
    func loadAnchorData(isGroupData : Bool, URLString : String, parameteres : [String : Any]? = nil, finishedCallback : @escaping () -> ()) {
        NetWorkTools.requestData(.get
        , URLString: URLString, parameters: parameteres) { (result) in
            
            //1、对结果进行处理
            guard let resultDict = result as? [String: Any] else {return}
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            
            //2、判断是否是分组数据
            if isGroupData {
                //2.1、遍历数组中的字典
                for dict in dataArray {
                    self.anchorGroups.append(AnchorGroup(dict: dict))
                }
            } else {
                //2.1、遍历数组中的字典
                let group = AnchorGroup()
                
                //2.2遍历dataArray的所有字典
                for dict in dataArray {
                    group.anchors.append(AnchorModel(dict: dict))
                }
                
                //2.3 将group添加到anchorGroups
                self.anchorGroups.append(group)
            }
                        
            //3、完成回调
            finishedCallback()
        }
    }
}
