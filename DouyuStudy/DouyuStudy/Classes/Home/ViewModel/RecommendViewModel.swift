//
//  RecommendViewModel.swift
//  DouyuStudy
//
//  Created by chengfeng on 2018/12/23.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class RecommendViewModel {

}

//发送网络请求
extension RecommendViewModel {
    func requestData() {
        //1.请求第一部分推荐数据
        
        //2.请求第二部分颜值数据
        
        //3.请求后面部分游戏数据
        let url = "http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1545578997"
//        print(NSDate.getCurrentTime())
        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: ["limit":"4","offset":"0","time":NSDate.getCurrentTime()]) { (result) in
            print(result)
        }
    }
}
