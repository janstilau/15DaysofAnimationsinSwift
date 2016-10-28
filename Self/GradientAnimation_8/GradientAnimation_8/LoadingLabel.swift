//
//  LoadingLabel.swift
//  GradientAnimation_8
//
//  Created by jansti on 16/10/28.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit


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
            
            
            
            
        }
    }
    
    
    
    
    
}






















