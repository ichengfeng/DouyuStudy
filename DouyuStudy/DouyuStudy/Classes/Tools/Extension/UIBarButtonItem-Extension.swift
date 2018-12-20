//
//  UIBarButtonItem-Extension.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/20.
//  Copyright © 2018 Fengzee. All rights reserved.
//
//UIBarButtonItem 扩展
import UIKit

extension UIBarButtonItem {
//    class func createItem(imageName : String,hightImageName : String,size : CGSize) -> UIBarButtonItem {
//        let btn = UIButton()
//        btn.setImage(UIImage(named: imageName), for: .normal)
//        btn.setImage(UIImage(named: hightImageName), for: .highlighted)
//        btn.frame = CGRect(origin: CGPoint.zero, size: size)
//        return UIBarButtonItem(customView: btn)
//    }
    //遍历构造函数：1.convenience开头 2.在构造函数中必须明确使用一个设计的构造函数（self）
    convenience init(imageName : String,hightImageName : String = "",size : CGSize = CGSize.zero) {
        //1、创建UIButton
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        if hightImageName != "" {
            btn.setImage(UIImage(named: hightImageName), for: .highlighted)
        }
        //设置btn尺寸
        if size == CGSize.zero{
            btn.sizeToFit()
        } else {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        
        self.init(customView:btn)
    }
}
