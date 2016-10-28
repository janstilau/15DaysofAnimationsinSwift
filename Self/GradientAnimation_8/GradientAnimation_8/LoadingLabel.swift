//
//  LoadingLabel.swift
//  GradientAnimation_8
//
//  Created by jansti on 16/10/28.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

@IBDesignable
class LoadingLabel: UIView{
    
    // MARK: - Types
    
    struct Constants {
        struct Fonts {
            static let loadingLable = "HelveticaNeue-UltraLight"
        }
    }
    
    
    // MARK: - Properties
    
    let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.startPoint = CGPointMake(0.0, 0.5)
        gradientLayer.endPoint = CGPointMake(1.0, 0.5)
        
        let colors = [UIColor.grayColor().CGColor, UIColor.whiteColor().CGColor, UIColor.grayColor().CGColor]
        gradientLayer.colors = colors
        
        let locations = [0.25, 0.5, 0.75]
        gradientLayer.locations = locations
        
        return gradientLayer
    }()
    
    let textAttributes: [String: AnyObject] = {
    
        let style = NSMutableParagraphStyle()
        style.alignment = .Center
        
        return [NSFontAttributeName: UIFont(name: Constants.Fonts.loadingLable, size: 70.0)!, NSParagraphStyleAttributeName: style]
    }()
    
    
    @IBInspectable var text: String!{
        didSet {
            setNeedsDisplay()
            UIGraphicsBeginImageContextWithOptions(frame.size, false, 0)
            text.drawInRect(bounds, withAttributes: textAttributes)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let maskLayer = CALayer()
            maskLayer.backgroundColor = UIColor.clearColor().CGColor
            maskLayer.frame = CGRectOffset(bounds, bounds.size.width, 0)
            maskLayer.contents = image.CGImage
            gradientLayer.mask = maskLayer
        }
    }
    
    // MARK: - View Life Cycle
    override func layoutSubviews() {
        gradientLayer.frame = CGRect(x: -bounds.size.width, y: bounds.origin.y, width: 2 * bounds.size.width, height: bounds.size.height)
    }
    
    override func didMoveToWindow() {
        
        super.didMoveToWindow()
        layer.addSublayer(gradientLayer)
        
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.75, 1.0, 1.0]
        gradientAnimation.duration = 1.7
        gradientAnimation.repeatCount = Float.infinity
        gradientAnimation.removedOnCompletion = false
        gradientAnimation.fillMode = kCAFillModeForwards
        
        gradientLayer.addAnimation(gradientAnimation, forKey: nil)
    }
}






















