//
//  MainViewController.swift
//  DouyuStudy
//
//  Created by Podinn on 2018/12/20.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(storyName: "Home")
        addChild(storyName: "Live")
        addChild(storyName: "Follow")
        addChild(storyName: "Profile")
    }
    private func addChild(storyName : String) {
        //1.通过storyboard获取控制器
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        //将childVc作为自控制器
        addChild(childVc)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
