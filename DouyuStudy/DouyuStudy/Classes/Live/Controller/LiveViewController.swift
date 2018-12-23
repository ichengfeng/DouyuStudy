//
//  LiveViewController.swift
//  DouyuStudy
//
//  Created by chengfeng on 2018/12/23.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit
import Alamofire

class LiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        Alamofire.request("https://httpbin.org/get").responseJSON { response in
//            print(response.request as Any)  // 原始的URL请求
//            print(response.response as Any) // HTTP URL响应
//            print(response.data as Any)     // 服务器返回的数据
//            print(response.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据
//
//            if let JSON = response.result.value {
//                print("JSON: \(JSON)")
//            }else{
//                print(response.result.error!)
//            }
//        }
//
//        let parameters = [
//            "foo": "bar",
//            "baz": ["a", 1],
//            "qux": [
//                "x": 1,
//                "y": 2,
//                "z": 3
//            ]
//            ] as [String : Any]
//        let urlString : String = "https://httpbin.org/post"
//
//        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//            if let JSON = response.result.value {
//                print("POST_JSON: \(JSON)")
//            }else{
//                print(response.result.error as Any)
//            }
//        }

        NetWorkTools.requestData(.get, URLString: "https://httpbin.org/get") { (response) in
             print(response)
        }
        
        let parameters = [
            "foo": "bar",
            "baz": ["a", 1],
            "qux": [
                "x": 1,
                "y": 2,
                "z": 3
            ]
            ] as [String : Any]
        NetWorkTools.requestData(.post, URLString: "https://httpbin.org/post", parameters: parameters) { (reponse) in
            print(reponse)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
