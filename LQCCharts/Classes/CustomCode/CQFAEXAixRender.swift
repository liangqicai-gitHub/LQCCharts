//
//  CQFAEXAixRender.swift
//  CQFAECharts
//
//  Created by 梁齐才(LIANGQICAI884) on 2018/8/27.
//

import UIKit

open class CQFAEXAixRender: XAxisRenderer {
    
    @objc open var customEntries = [Double()]
    
    override open func computeAxisValues(min: Double, max: Double) {
        if customEntries.count <= 0 {
            super.computeAxisValues(min: min, max: max)
        } else {
            self.axis?.entries.removeAll()
            for i in 0 ..< customEntries.count {
                self.axis?.entries.append(customEntries[i])
            }
            self.computeSize()
        }
    }
    
}
