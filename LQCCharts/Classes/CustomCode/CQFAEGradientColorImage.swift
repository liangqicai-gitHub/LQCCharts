//
//  GradientColorImage.swift
//  LQCCharts
//
//  Created by 梁齐才(LIANGQICAI884) on 2018/8/29.
//

import UIKit

@objc public extension UIImage {
    
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


