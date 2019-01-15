//
//  FunnyViewModel.swift
//  DouyuStudy
//
//  Created by Podinn on 2019/1/15.
//  Copyright © 2019 Fengzee. All rights reserved.
//

import UIKit

class FunnyViewModel : BaseViewModel{

}

extension FunnyViewModel {
    func loadFunnyData(finishedCallback : @escaping () -> ()) {
        loadAnchorData(isGroupData:false, URLString: "https://capi.douyucdn.cn/api/v1/getColumnRoom/2", parameteres: ["limit":30,"offset":0], finishedCallback: finishedCallback)
    }
}
