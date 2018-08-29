//
//  GradientColorImage.swift
//  LQCCharts
//
//  Created by 梁齐才(LIANGQICAI884) on 2018/8/29.
//

import UIKit

@objc extension UIImage {
    
//    @objc public static func cqfae_gradientColorImageTopToBottom(with colors: [UIColor], size: CGSize) -> UIImage? {
//
//        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
//        guard let contextRef = UIGraphicsGetCurrentContext() else {return nil}
//
//        let colorSpace = CGColorSpaceCreateDeviceRGB()
//
//        let startColor = UIColor.red
//        guard let startColorComponents = startColor.cgColor.components else { return nil}
//
//        let endColor = UIColor.blue
//        guard let endColorComponents = endColor.cgColor.components else { return nil}
//
//        let colorComponents = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3],
//                               endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
//
//        let locations:[CGFloat] = [0.0, 1.0]
//
//        guard let gradient = CGGradient(colorSpace: colorSpace,colorComponents: colorComponents,locations: locations,count: 2) else { return nil}
//
//
//        let path = CGMutablePath()
//        let imageRect = CGRect(origin: CGPoint.zero, size: size)
//
//        path.move(to: imageRect.origin)
//        path.addLine(to: CGPoint(x: imageRect.maxX, y: imageRect.minY))
//        path.addLine(to: CGPoint(x: imageRect.maxX, y: imageRect.maxY))
//        path.addLine(to: CGPoint(x: imageRect.minX, y: imageRect.maxX))
//        path.addLine(to: imageRect.origin)
//        path.closeSubpath()
//
//        let pathRect = path.boundingBox
//        let startPoint = CGPoint(x: pathRect.minX, y: pathRect.minY)
//        let endPoint = CGPoint(x: pathRect.maxX, y: pathRect.maxY)
//
//        contextRef.saveGState()
//        contextRef.addPath(path)
//        contextRef.clip()
//        contextRef.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
//        contextRef.restoreGState()
//
//
//
//
//
//        let image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//
//        return image
//
//    }
    
    
    @objc public static func cqfae_gradientColorImageTopToBottom(with colors: [UIColor], size: CGSize) -> UIImage? {
        
        guard colors.count > 0 || !size.equalTo(CGSize.zero) else {
            return nil
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(origin: CGPoint.zero, size: size)
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.colors = colors.map({ (color) -> CGColor in
            return color.cgColor
        })
        
        UIGraphicsBeginImageContextWithOptions(gradientLayer.frame.size, gradientLayer.isOpaque, 0);
        guard let contextRef = UIGraphicsGetCurrentContext() else {return nil}
        gradientLayer.render(in: contextRef)
        
        let rs = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return rs
        
    }
    
    
}


