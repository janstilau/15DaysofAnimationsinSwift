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
        
        
        return gradientLayer
    }()
    
    @IBInspectable var text: String!{
        
        didSet {
            
        }
    }
    
    
    
    
    
}






















