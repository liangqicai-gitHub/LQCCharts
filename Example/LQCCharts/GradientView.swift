//
//  GradientView.swift
//  LQCCharts_Example
//
//  Created by 梁齐才(LIANGQICAI884) on 2018/8/29.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import UIKit

class GradientView: UIView {

   
    override func draw(_ rect: CGRect) {
        guard let iamge = UIImage.cqfae_gradientColorImageTopToBottom(with: [UIColor.red,UIColor.blue], size: CGSize(width: 2, height: 2)) else {
            return
        }
        
        iamge.draw(in: CGRect(x: 10, y: 0, width: 30, height: 500))
        
//        iamge.draw(in: CGRect(x: 0, y: 0, width: 10, height: 100))
        
    }
 

}
