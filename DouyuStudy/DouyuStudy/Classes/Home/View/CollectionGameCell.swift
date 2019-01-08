//
//  CollectionGameCell.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/29.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class CollectionGameCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    //定义模型属性
    var baseGame : BaseGameModel? {
        didSet{
            
            titleLabel.text = baseGame?.tag_name
            
            if let iconUrl = URL(string: baseGame?.icon_url ?? "") {
                iconImageView.kf.setImage(with: iconUrl)
            } else {
                iconImageView.image = UIImage(named: "home_more_btn")
            }
            
        }
        
    }
    
    //系统回调
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

