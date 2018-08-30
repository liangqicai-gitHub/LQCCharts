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
    
    
    override open func drawLabels(context: CGContext, pos: CGFloat, anchor: CGPoint) {
        
        guard
            let xAxis = self.axis as? XAxis,
            let transformer = self.transformer
            else { return }
        
        #if os(OSX)
        let paraStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        #else
        let paraStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        #endif
        paraStyle.alignment = .center
        
        
        
        let labelRotationAngleRadians = xAxis.labelRotationAngle.DEG2RAD
        
        let centeringEnabled = xAxis.isCenterAxisLabelsEnabled
        
        let valueToPixelMatrix = transformer.valueToPixelMatrix
        
        var position = CGPoint(x: 0.0, y: 0.0)
        
        var labelMaxSize = CGSize()
        
        if xAxis.isWordWrapEnabled
        {
            labelMaxSize.width = xAxis.wordWrapWidthPercent * valueToPixelMatrix.a
        }
        
        let entries = xAxis.entries
        
        for i in stride(from: 0, to: entries.count, by: 1)
        {
            if centeringEnabled
            {
                position.x = CGFloat(xAxis.centeredEntries[i])
            }
            else
            {
                position.x = CGFloat(entries[i])
            }
            
            position.y = 0.0
            position = position.applying(valueToPixelMatrix)
            
            if viewPortHandler.isInBoundsX(position.x)
            {
                let label = xAxis.valueFormatter?.stringForValue(xAxis.entries[i], axis: xAxis) ?? ""
                
                let labelns = label as NSString
                
                let labelAttrs: [NSAttributedStringKey : Any] = [NSAttributedStringKey.font: xAxis.labelFont,
                                                                 NSAttributedStringKey.foregroundColor: xAxis.cqfae_lableColor(at: i),
                                                                 NSAttributedStringKey.paragraphStyle: paraStyle]
                
                if xAxis.isAvoidFirstLastClippingEnabled
                {
                    // avoid clipping of the last
                    if i == xAxis.entryCount - 1 && xAxis.entryCount > 1
                    {
                        let width = labelns.boundingRect(with: labelMaxSize, options: .usesLineFragmentOrigin, attributes: labelAttrs, context: nil).size.width
                        
                        if width > viewPortHandler.offsetRight * 2.0
                            && position.x + width > viewPortHandler.chartWidth
                        {
                            position.x -= width / 2.0
                        }
                    }
                    else if i == 0
                    { // avoid clipping of the first
                        let width = labelns.boundingRect(with: labelMaxSize, options: .usesLineFragmentOrigin, attributes: labelAttrs, context: nil).size.width
                        position.x += width / 2.0
                    }
                }
                
                drawLabel(context: context,
                          formattedLabel: label,
                          x: position.x,
                          y: pos,
                          attributes: labelAttrs,
                          constrainedToSize: labelMaxSize,
                          anchor: anchor,
                          angleRadians: labelRotationAngleRadians)
            }
        }
    }
}
