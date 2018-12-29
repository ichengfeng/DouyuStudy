//
//  CollectionPrettyCell.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/21.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: CollectionBaseCell {

    
    @IBOutlet weak var cityBtn: UIButton!
    
    //定义模型属性
    override var anchor : AnchorModel? {
        didSet {
            super.anchor = anchor
            //所在城市
            cityBtn.setTitle(anchor?.anchor_city, for: .normal)
        }
    }
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

}
