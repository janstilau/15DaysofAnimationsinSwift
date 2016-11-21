//
//  ProgressView.swift
//  ProgressAnimation
//
//  Created by Larry Natalicio on 4/22/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//

import UIKit

@IBDesignable
class ProgressView: UIView {
    
    // MARK: - Types
    
    struct Constants {
        struct ColorPalette {
            static let teal = UIColor(red:0.27, green:0.80, blue:0.80, alpha:1.0)
            static let orange = UIColor(red:0.90, green:0.59, blue:0.20, alpha:1.0)
            static let pink = UIColor(red:0.98, green:0.12, blue:0.45, alpha:1.0)
        }
    }
    
    // MARK: - Properties

    let progressLayer = CAShapeLayer()
    let gradientLayer = CAGradientLayer()
    
    var range: CGFloat = 128
    var curValue: CGFloat = 0 {
        didSet {
            animateStroke()
        }
    }
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayers()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        // prepareForInterfaceBuilder is used with @IBDesignable to display
        // this view in the Storyboard.
        setupLayers()
    }
    
    // MARK: - Convenience
    
    func setupLayers() {
        
        // Setup progress layer.
//        progressLayer.position = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)
        progressLayer.lineWidth = 3.0
        progressLayer.strokeEnd = 0.0
        progressLayer.strokeStart = 0.5
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.blackColor().CGColor

        let radius = CGFloat(self.bounds.height/2) - progressLayer.lineWidth
        let startAngle = CGFloat(-M_PI / 2)
        let endAngle = CGFloat(3 * M_PI / 2)
        let width = CGRectGetWidth(self.bounds)
        let height = CGRectGetHeight(self.bounds)
        let modelCenter = CGPointMake(width / 2, height / 2)
        let path = UIBezierPath(arcCenter: modelCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)

        progressLayer.path = path.CGPath

        
        
        // Setup gradient layer.
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: CGRectGetWidth(self.bounds), height: CGRectGetHeight(self.bounds))
        gradientLayer.colors = [Constants.ColorPalette.teal.CGColor, Constants.ColorPalette.orange.CGColor, Constants.ColorPalette.pink.CGColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.mask = progressLayer // Use progress layer as mask for gradient layer.
        layer.addSublayer(gradientLayer)
        
        
        
        // strokeEnd 是shapeLayer 的一个属性,和strokeStart是相互对应的.两者都是用的相对坐标,0.0到1.0,strokeStart是开始的位置,strokeEnd是结束的位置,表示绘画边缘条线的范围.如果是strat大于end,不绘制边缘.这个例子,不填充shapeLayer,然后让shapeLayer作为下面gradientLayer的mask,对shapelayer的strokeEnd做动画,最终完成了效果.
    }
    
    func animateStroke() {
        let fromValue = progressLayer.strokeEnd
        let toValue = curValue / range
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = fromValue
        animation.toValue = toValue
        
        progressLayer.addAnimation(animation, forKey: "stroke")
        progressLayer.strokeEnd = toValue
    }

}

