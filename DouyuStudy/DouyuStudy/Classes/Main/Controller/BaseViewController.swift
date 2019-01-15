//
//  BaseViewController.swift
//  DouyuStudy
//
//  Created by Podinn on 2019/1/15.
//  Copyright © 2019 Fengzee. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    //定义属性
    var contentView : UIView?
    
    //懒加载属性
    fileprivate lazy var animationImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "img_loading_1"))
        imageView.center = self.view.center
        imageView.animationImages = [UIImage(named: "img_loading_1")!,UIImage(named: "img_loading_2")!]
        imageView.animationDuration = 0.5;
        imageView.animationRepeatCount = LONG_MAX
        imageView.autoresizingMask = [.flexibleTopMargin,.flexibleBottomMargin]
        return imageView
    }()
    
    //系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

extension BaseViewController {
    @objc func setupUI() {
        
        //先隐藏内容的view
        contentView?.isHidden = true
        
        //添加执行动画的UIImageView
        view.addSubview(animationImageView)
        
        //3、给animationImageView执行动画
        animationImageView.startAnimating()
        
        //4、设置view背景颜色
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
    }
    
    func loadDataFinished(){
        //1、停止动画
        animationImageView.stopAnimating()
        
        //2、隐藏animationImageView
        animationImageView.isHidden = true
        
        //3、显示内容的View
        contentView?.isHidden = false
    }
    
}
