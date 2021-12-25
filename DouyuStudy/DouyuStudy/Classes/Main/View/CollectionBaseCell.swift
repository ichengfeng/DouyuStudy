//
//  CollectionBaseCell.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/28.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class CollectionBaseCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    //定义模型
    public var anchor : AnchorModel? {
        didSet {
            guard let anchor = anchor else {return}
            //在线人数
            var onlineString : String = ""
            if anchor.online >= 10000 {
                onlineString = "\(Int(anchor.online/10000))万在线"
            }else {
                onlineString = "\(anchor.online)在线"
            }
            onlineBtn.setTitle(onlineString, for: .normal)
            
            //昵称
            nickNameLabel.text = anchor.nickname
            
            
            //设置封面图片
            guard let iconURL = URL(string: anchor.vertical_src) else {return}
            iconImageView.kf.setImage(with: iconURL)
            
        }
    }
    
}
