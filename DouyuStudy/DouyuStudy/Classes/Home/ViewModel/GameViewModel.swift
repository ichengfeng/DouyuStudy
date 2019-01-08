//
//  GameViewModel.swift
//  DouyuStudy
//
//  Created by Podinn on 2019/1/8.
//  Copyright © 2019 Fengzee. All rights reserved.
//

import UIKit

class GameViewModel {
    lazy var games : [GameModel] = [GameModel]()
}

extension GameViewModel {
    func loadAllGameData(finishedCallBack : @escaping () -> ()) {
        NetWorkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: nil) { (result) in

            //1、获取到数据
            guard let resultDict = result as? [String : Any] else {return}
            guard let dataArray = resultDict["data"] as? [[String : Any]] else {return}
            //2、字典转模型
            for dict in dataArray {
                self.games.append(GameModel(dict: dict))
            }
            //3、完成回调
            finishedCallBack()
        }
    }
}
