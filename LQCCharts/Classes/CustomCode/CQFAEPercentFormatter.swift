//
//  CQFAEPercentFormatter.swift
//  CQFAECharts_Example
//
//  Created by 梁齐才(LIANGQICAI884) on 2018/8/23.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

open class CQFAEPercentFormatter: IAxisValueFormatter {

    
    @objc public init(){
//        super.init()
    }
    
    private var _formatter: NumberFormatter?
    
    
    static let numberFormatter = {
        
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if _formatter == nil {
            let pFormatter = NumberFormatter()
            pFormatter.numberStyle = .percent
            pFormatter.minimumFractionDigits = 0
            pFormatter.maximumFractionDigits = 2
            pFormatter.multiplier = 1.00
            pFormatter.percentSymbol = " %"
            _formatter = pFormatter
        }
        
        return _formatter!.string(from: NSNumber.init(value: value)) ?? ""
    }

}
