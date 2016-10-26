//
//  SonarAnnotationView.swift
//  MapRippleAnimation_3
//
//  Created by jansti on 16/10/26.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit
import MapKit

class SonarAnnotationView: MKAnnotationView {
    
    // MARK: - Types
    
    struct Constants {
        struct  ColorPalette {
            static let green = UIColor.init(red: 0.00, green: 0.87, blue: 0.71, alpha: 1.0)
        }
    }
    
    // MARK: - Property
    
    let bubbleCount = 3
    let sonarDuration = 2.76
    
    // MARK: - INIT
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        startAnimation()
    }
    
    
    // 这里,如果没有完成,init(frame: CGRect) 会崩溃.调用的顺序是,init(annotation,reuseIdentifier),然后这个方法的内部,会调用init(frame)来进行view的初始化,但是,swift里面,init方法是不会自动继承的.super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Animation
    
    func sonar(beginTime: CFTimeInterval){
        // 扩散开始的circle
        let circlePath1 = UIBezierPath.init(arcCenter: self.center, radius: CGFloat(3), startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true)
        // 扩散最后的circle
        let circlePath2 = UIBezierPath.init(arcCenter: self.center, radius: CGFloat(80), startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = Constants.ColorPalette.green.CGColor
        shapeLayer.fillColor = Constants.ColorPalette.green.CGColor
        shapeLayer.path = circlePath1.CGPath
        self.layer.addSublayer(shapeLayer)
        
        
        let pathAnimation = CABasicAnimation.init(keyPath: "path")
        pathAnimation.fromValue = circlePath1.CGPath
        pathAnimation.toValue = circlePath2.CGPath
        
        let alphaAnimation = CABasicAnimation.init(keyPath: "opacity")
        alphaAnimation.fromValue = 0.8
        alphaAnimation.toValue = 0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.beginTime = beginTime
        animationGroup.animations = [pathAnimation, alphaAnimation]
        animationGroup.duration = sonarDuration
        animationGroup.repeatCount = FLT_MAX
        animationGroup.delegate = self
        animationGroup.removedOnCompletion = false
        animationGroup.fillMode = kCAFillModeForwards
        
        shapeLayer.addAnimation(animationGroup, forKey: "sonar")
    }
    
    func startAnimation(){
        
        for i in 0..<bubbleCount{
            sonar(CACurrentMediaTime() + sonarDuration / Double(bubbleCount) * Double(i))
        }
    }
    
}




