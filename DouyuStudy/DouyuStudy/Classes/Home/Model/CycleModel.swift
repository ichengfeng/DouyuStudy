//
//  CycleModel.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/29.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    //标题
    @objc var title : String = ""
    //展示的图片地址
    @objc var pic_url : String = ""
    //主播信息对应的字典
    @objc var room : [String : NSObject]? {
        didSet {
            guard let room = room else {return}
            anchor = AnchorModel(dict: room)
        }
    }
    //主播信息对应的模型对象
    @objc var anchor : AnchorModel?
    
    
    //自定义构造函数
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
