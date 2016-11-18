////
////  EventsModel.swift
////  DiaryMVC
////
////  Created by Vladimir Saprykin on 14.11.16.
////  Copyright © 2016 Vladimir Saprykin. All rights reserved.
////
//
//import UIKit
//import RealmSwift
//
//class EventsModel: UIView {
//    
//    private let spaceBetweenBlocks: CGFloat = 20
//    private let blockHeight: CGFloat = 40
//    private let contentOffsetY: CGFloat = 20
//    private let contentOffsetX: CGFloat = 10
//    private let textOffsetX: CGFloat = 7
//    private let imageOffset: CGFloat = 7
//    private let borderWidth: CGFloat = 2
//    private let recordBackgroundColor: UIColor = UIColor.white
//    
//    private var recordTintColor: UIColor = UIColor.lightGray
//    
//    private var dateView: UIView!
//    private var weatherView: UIView!
//    private var titleView: UIView!
//    private var linesView: UIView!
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//    }
//    
//    convenience init(date: String? = nil, weatherImage: UIImage? = nil, title: String? = nil, tint: UIColor? = nil) {
//        self.init(frame: CGRect.zero)
//        
//        if let tint = tint {
//            recordTintColor = tint
//        }
//        
//        drawDate(date)
//        drawWeather(weatherImage)
//        drawTitle(title)
//        drawLines()
//    }
//    
//    private func drawDate(_ date: String?) {
//        dateView = UIView(frame: CGRect(x: contentOffsetX, y: contentOffsetY, width: 75, height: blockHeight))
//        
//        dateView.backgroundColor = recordBackgroundColor
//        
//        dateView.layer.borderWidth = borderWidth
//        dateView.layer.borderColor = recordTintColor.cgColor
//        dateView.layer.cornerRadius = dateView.frame.height / 2
//        
//        let dateText = UILabel(frame: CGRect(
//            x: textOffsetX,
//            y: 0,
//            width: dateView.bounds.width - textOffsetX * 2,
//            height: dateView.bounds.height))
//        
//        if let dateCreated = date {
//            dateText.text = dateCreated
//        }
//        
//        dateText.textColor = recordTintColor
//        dateText.textAlignment = .center
//        dateView.addSubview(dateText)
//        
//        addSubview(dateView)
//        
//        if date == nil {
//            dateView.isHidden = true
//        }
//    }
//    
//    private func drawWeather(_ weatherImage: UIImage?) {
//        weatherView = UIView(frame: CGRect(
//            x: dateView.frame.origin.x + dateView.frame.width + spaceBetweenBlocks,
//            y: contentOffsetY,
//            width: blockHeight,
//            height: blockHeight))
//        
//        weatherView.backgroundColor = recordBackgroundColor
//        
//        weatherView.layer.borderWidth = borderWidth
//        weatherView.layer.borderColor = recordTintColor.cgColor
//        weatherView.layer.cornerRadius = weatherView.frame.height / 2
//        
//        if let weatherImage = weatherImage{
//            let weatherImageView = UIImageView(frame: CGRect(
//                x: imageOffset,
//                y: imageOffset,
//                width: blockHeight - imageOffset * 2,
//                height: blockHeight - imageOffset * 2))
//            weatherImageView.image = weatherImage.withRenderingMode(.alwaysTemplate)
//            weatherImageView.tintColor = recordTintColor
//            weatherView.addSubview(weatherImageView)
//        }
//        
//        addSubview(weatherView)
//        
//        if weatherImage == nil{
//            weatherView.isHidden = true
//        }
//    }
//    
//    private func drawTitle(_ title: String?){
//        titleView = UIView(frame: CGRect(
//            x: weatherView.frame.origin.x + weatherView.frame.width + spaceBetweenBlocks,
//            y: 0,
//            width: 200,
//            height: blockHeight))
//        
//        titleView.backgroundColor = recordBackgroundColor
//        
//        titleView.layer.borderWidth = borderWidth
//        titleView.layer.borderColor = recordTintColor.cgColor
//        titleView.layer.cornerRadius = titleView.frame.height / 2
//        
//        let titleText = UILabel(frame: CGRect(
//            x: textOffsetX,
//            y: 0,
//            width: titleView.bounds.width - textOffsetX * 2,
//            height: titleView.bounds.height))
//        
//        titleText.textAlignment = .left
//        titleText.textColor = recordTintColor
//        titleView.addSubview(titleText)
//        
//        if let title = title{
//            if title != ""{
//                titleText.text = title
//                
//                let textBounds = titleText.textRect(forBounds: titleView.bounds, limitedToNumberOfLines: 1)
//                
//                var boundsWidth = textBounds.width
//                
//                if boundsWidth < blockHeight - textOffsetX * 2{
//                    boundsWidth = blockHeight - textOffsetX * 2
//                }
//                
//                titleView.frame = CGRect(
//                    x: weatherView.frame.origin.x + weatherView.frame.width + spaceBetweenBlocks,
//                    y: contentOffsetY,
//                    width: boundsWidth + textOffsetX * 2,
//                    height: blockHeight)
//            }
//        }
//        
//        addSubview(titleView)
//        
//        if title == nil || title == ""{
//            titleView.isHidden = true
//        }
//    }
//    
//    private func drawLines(){
//        var offsetX: CGFloat
//        
//        if !titleView.isHidden{
//            offsetX = titleView.frame.origin.x
//        }
//        else if !weatherView.isHidden{
//            offsetX = weatherView.frame.origin.x
//        }
//        else if !dateView.isHidden{
//            offsetX = dateView.frame.origin.x
//        }
//        else{
//            offsetX = contentOffsetX + dateView.frame.width / 2
//        }
//        
//        linesView = UIView(frame: CGRect(
//            x: 0,
//            y: 0,
//            width: offsetX,
//            height: contentOffsetY + blockHeight / 2))
//        
//        let linePath = UIBezierPath()
//        linePath.move(to: CGPoint(
//            x: contentOffsetX + dateView.frame.width / 2,
//            y: 0))
//        linePath.addLine(to: CGPoint(
//            x: contentOffsetX + dateView.frame.width / 2,
//            y: contentOffsetY + blockHeight))
//        linePath.move(to: CGPoint(
//            x: contentOffsetX + dateView.frame.width / 2,
//            y: contentOffsetY + blockHeight / 2))
//        linePath.addLine(to: CGPoint(
//            x: offsetX,
//            y: contentOffsetY + blockHeight / 2))
//        
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.path = linePath.cgPath
//        shapeLayer.strokeColor = UIColor.gray.cgColor
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.lineWidth = borderWidth
//        
//        linesView.layer.addSublayer(shapeLayer)
//        
//        insertSubview(linesView, at: 0)
//    }
//    
//    
//    
//}
