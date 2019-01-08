//
//  NSDate_Extension.swift
//  DouyuStudy
//
//  Created by chengfeng on 2018/12/23.
//  Copyright © 2018 Fengzee. All rights reserved.
//

import Foundation

extension NSDate {
    static func getCurrentTime() -> String {
        let nowDate = NSDate()
        let interval = nowDate.timeIntervalSince1970
        return "\(interval)"
    }
}
