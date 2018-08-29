//
//  CQFAETitlesFormatter.swift
//  CQFAECharts_Example
//
//  Created by 梁齐才(LIANGQICAI884) on 2018/8/23.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

open class CQFAETitlesFormatter: IAxisValueFormatter {
    
    @objc open var titiles = ["第一","第二","第三","第四","第五"]
    
    @objc public init(){
//        super.init()
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let index = value >= 0 ? Int(value) : 0
        if index < titiles.count {
            return titiles[index]
        }else{
            return "其他"
        }
        
    }
    
}
