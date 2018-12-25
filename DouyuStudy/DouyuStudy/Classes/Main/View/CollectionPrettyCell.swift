//
//  CollectionPrettyCell.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/21.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionPrettyCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var cityBtn: UIButton!
    
    
    //定义模型属性
    var anchor : AnchorModel? {
        didSet {
            
            guard let anchor = anchor else {return}
            //在线人数
            var onlineString : String = ""
            if anchor.online >= 10000 {
                onlineString = "\(Int(anchor.online/10000))万在线"
            }else {
                onlineString = "\(anchor.online)在线"
            }
            onlineBtn.text = onlineString
            
            //昵称
            nickNameLabel.text = anchor.nickname
            
            //所在城市
            cityBtn.setTitle(anchor.anchor_city, for: .normal)
            
            //设置封面图片
            guard let iconURL = URL(string: anchor.vertical_src) else {return}
//            iconImageView.kf.setImage(with:ImageResource.init(downloadURL: iconURL as URL))
            iconImageView.kf.setImage(with: iconURL)
        }
    }
    
    
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

}
