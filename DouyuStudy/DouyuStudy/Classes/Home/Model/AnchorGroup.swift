//
//  AnchorGroup.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/25.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class AnchorGroup: BaseGameModel {
    //改组中的房间信息
    @objc var room_list : [[String:NSObject]]? {
        didSet {
            guard let room_list = room_list else {return}
            for dict in room_list {
                anchors.append(AnchorModel(dict: dict))
            }
        }
    }
    
    //组显示的图标
    @objc var small_icon_url : String = "home_header_normal"
    //定义的模型对象数组
    @objc lazy var anchors : [AnchorModel] = [AnchorModel]()

}


