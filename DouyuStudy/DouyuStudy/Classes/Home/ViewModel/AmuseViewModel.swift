//
//  AmuseViewModel.swift
//  DouyuStudy
//
//  Created by Podinn on 2019/1/14.
//  Copyright © 2019 Fengzee. All rights reserved.
//

import UIKit

class AmuseViewModel : BaseViewModel {
    
}

extension AmuseViewModel {
    func loadAmuseData(finishedCallback : @escaping () -> ()){
        loadAnchorData(isGroupData:true, URLString: "https://capi.douyucdn.cn/api/v1/getHotRoom/2", finishedCallback: finishedCallback)
//        NetWorkTools.requestData(.get
//        , URLString: "https://capi.douyucdn.cn/api/v1/getHotRoom/2") { (result) in
//
//            //1、对结果进行处理
//            guard let resultDict = result as? [String: Any] else {return}
//            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
//
//            //2、遍历数组中的字典
//            for dict in dataArray {
//                self.anchorGroups.append(AnchorGroup(dict: dict))
//            }
//
//            //3、完成回调
//            finishedCallback()
//        }
    }
}
