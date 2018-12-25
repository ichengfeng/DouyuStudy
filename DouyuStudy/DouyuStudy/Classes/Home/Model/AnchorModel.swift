//
//  AnchorModel.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/25.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    //房间ID
    @objc var room_id : Int = 0
    @objc var room_name : String = ""
    //房间图片链接
    @objc var vertical_src : String = ""
    //判断是手机直播还是电脑直播 0电脑，1手机直播
    @objc var isVertical : Int = 0
    //昵称
    @objc var nickname : String = ""
    //观看人数
    @objc var online : Int = 0
    //所在城市
    @objc var anchor_city : String = ""
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
