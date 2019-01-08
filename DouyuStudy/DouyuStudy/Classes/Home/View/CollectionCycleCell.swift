//
//  CollectionCycleCell.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/29.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class CollectionCycleCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    var cycleModel :CycleModel? {
        didSet {
            titleLabel.text = cycleModel?.title
            if let iconURL = URL(string: cycleModel?.pic_url ?? "") {
                iconImageView.kf.setImage(with: iconURL)
            } else {
                iconImageView.image = UIImage(named: "Img_default")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
