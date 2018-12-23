//
//  NetworkTools.swift
//  DouyuStudy
//
//  Created by chengfeng on 2018/12/23.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetWorkTools {
    
    ///   请求方法简单封装
    ///
    /// - Parameters:
    ///   - type: 请求类型post/get
    ///   - URLString: URL
    ///   - parameters: 参数，默认为空
    ///   - finishedCallback: 将请求结果返回
    class func requestData(_ type : MethodType,URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            // 3.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result)
        }
    }
    
}
