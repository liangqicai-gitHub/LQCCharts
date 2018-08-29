//
//  ViewController.swift
//  LQCCharts
//
//  Created by 梁齐才(LIANGQICAI884) on 08/28/2018.
//  Copyright (c) 2018 梁齐才(LIANGQICAI884). All rights reserved.
//

import UIKit
import LQCCharts

class ViewController: UIViewController {

    
    var _chartView: CombinedChartView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVarsAndViews()
        configX()
        configData()
        
        
//        let x = UIImage.cqfae_gradientColorImageTopToBottom(with: [UIColor.blue,UIColor.green], size: CGSize(width: 2, height: 2))
//        let imageView = UIImageView.init(image: x)
//        view.addSubview(imageView)
//        imageView.frame = CGRect(x: 10, y: 70, width: 5, height: 10)
        
        
//        let x = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 300))
//        x.image = UIImage.cqfae_gradientColorImageTopToBottom(with: [UIColor.red, UIColor.blue], size: CGSize(width: 10, height: 10))
//        view.addSubview(x)
//        if (x.contentMode == .scaleToFill){
//            print("hahaha")
//        }
//        print("\(x.contentMode)")
//        x.contentMode
        
//        let x = GradientView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 500))
//        view.addSubview(x)
        
        
    }
    
    func initVarsAndViews() {
        _chartView = CombinedChartView()
        _chartView?.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.addSubview(_chartView!)
        _chartView?.frame = CGRect(x: 0, y: 60, width: 320, height: 300)
        _chartView?.legend.enabled = false
        
        let originalRender = _chartView?.renderer as? CombinedChartRenderer
        if let _ = originalRender {
            _chartView?.renderer = CQFAEGradientCombinedChartRenderer(chart: originalRender!.chart!,
                                                                      animator: originalRender!.animator,
                                                                      viewPortHandler: originalRender!.viewPortHandler)
        }
        
        
    }
    
    
    func configX() {
        let xAxis = _chartView?.xAxis
        xAxis?.axisMinimum = -0.5
        xAxis?.axisMaximum = 5.5
        xAxis?.granularity = 1.0
        xAxis?.labelFont = .systemFont(ofSize: 11)
        xAxis?.labelTextColor = UIColor.black.withAlphaComponent(0.7)
        xAxis?.drawGridLinesEnabled = false
        xAxis?.labelPosition = .bottom
        xAxis?.yOffset = 16
        
        xAxis?.valueFormatter = CQFAETitlesFormatter()
        let titles = ["上海","北京","深圳","广州","杭州","厦门"]
        (xAxis?.valueFormatter as? CQFAETitlesFormatter)?.titiles = titles
        
        (_chartView?.xAxisRenderer as? CQFAEXAixRender)?.customEntries = (0 ..< titles.count).map({ (i) -> Double in
            return Double(i)
        })
    }
    
    func configData() {
        let combineData = CombinedChartData()
        
//        combineData.lineData = generateLineData()
        combineData.barData = generateBarData()
        
        
        _chartView?.data = combineData
        
        
    }
    
    
    func generateBarData() -> BarChartData {
        let data1 = [15,15,15,15,15]
        let data2 = [28,22,10,20,12]
        let entries1 = (0..<data1.count).map { i -> BarChartDataEntry in
            return BarChartDataEntry(x: Double(i), y: Double(data1[i]))
        }
        let entries2 = (0..<5).map { i -> BarChartDataEntry in
            return BarChartDataEntry(x: Double(i), y: Double(data2[i]))
        }
        
        let set1 = BarChartDataSet(values: entries1, label: "Bar 1")
        set1.colors = [UIColor.orange,UIColor.orange]
        //        set1.setColors([UIColor.orange,UIColor.yellow])
        //        set1.setColor(UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1))
        set1.valueTextColor = UIColor(red: 60/255, green: 220/255, blue: 78/255, alpha: 1)
        set1.valueFont = .systemFont(ofSize: 10)
        set1.axisDependency = .left
        
        let set2 = BarChartDataSet(values: entries2, label: "")
        set2.stackLabels = ["Stack 1", "Stack 2"]
        set2.setColor(.red)
        set2.valueTextColor = UIColor(red: 61/255, green: 165/255, blue: 255/255, alpha: 1)
        set2.valueFont = .systemFont(ofSize: 10)
        set2.axisDependency = .left
        
        let barSpace = 0.1 // x2 dataset
        let barWidth = 0.2 // x2 dataset
        let groupSpace = 1.0 - (barSpace + barWidth) * 2.0
        
        
        let fromX = 0.0 - groupSpace / 2.0 - (barWidth + barSpace)
        
        
        // (0.45 + 0.02) * 2 + 0.06 = 1.00 -> interval per "group"
        
        let data = BarChartData(dataSets: [set1, set2])
        data.barWidth = barWidth
        
        // make this BarData object grouped
        data.groupBars(fromX: fromX, groupSpace: groupSpace, barSpace: barSpace)
        
        return data
    }

   
}

