//
//  CollectionNormalCell.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/21.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class CollectionNormalCell: CollectionBaseCell {
    
    @IBOutlet weak var roomNameLabel: UILabel!
    
    //定义模型属性
    override var anchor : AnchorModel? {
        didSet {
            //1、将属性传递给父类
           super.anchor = anchor
            //2、设置房间名称
            roomNameLabel.text = anchor?.room_name
        }
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

}
