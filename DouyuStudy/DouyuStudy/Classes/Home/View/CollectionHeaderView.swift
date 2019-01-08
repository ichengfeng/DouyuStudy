//
//  CollectionHeaderView.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/21.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class CollectionHeaderView: UICollectionReusableView {
    //控件属性
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var moreButton: UIButton!
    
    var group : AnchorGroup? {
        didSet {
            titleLabel.text = group?.tag_name
            iconImageView.image = UIImage(named: group?.small_icon_url ?? "home_header_normal")
        }
    }
}

// MARK - 从xib中快速创建的类方法
extension CollectionHeaderView {
    class func collectionHeaderView() -> CollectionHeaderView {
        return Bundle.main.loadNibNamed("CollectionHeaderView", owner: self, options: nil)?.first as! CollectionHeaderView
    }
}
