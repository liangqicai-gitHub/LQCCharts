//
//  CQFAEColorsLabelsAxisBase.swift
//  LQCCharts
//
//  Created by 梁齐才(LIANGQICAI884) on 2018/8/30.
//

import UIKit

@objc public extension AxisBase {
    
    private struct AssociatedKeys {
        static var labelTextColorsKey = "LQCCharts.AxisBase.labelTextColorsKey"
    }
    
    @objc public var cqfae_labelTextColors: [UIColor]? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.labelTextColorsKey) as? [UIColor]
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.labelTextColorsKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    /// 获取自定义的label颜色   如果没有通过 cqfae_labelTextColors 设置颜色，那么就返回AxisBase中设置的颜色
    ///
    /// - Parameter index: label index
    /// - Returns: UIColor
    public func cqfae_lableColor(at index: Int) -> UIColor {
        guard index >= 0 else {return labelTextColor}
        guard let cqfaeLabelColors = cqfae_labelTextColors else {return labelTextColor}
        guard cqfaeLabelColors.count > 0 else {return labelTextColor}
        
        return cqfaeLabelColors[index % cqfaeLabelColors.count]
    }
    
}
