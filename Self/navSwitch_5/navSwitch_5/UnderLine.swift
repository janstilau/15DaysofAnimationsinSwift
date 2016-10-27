//
//  UnderLine.swift
//  navSwitch_5
//
//  Created by jansti on 16/10/27.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit


@IBDesignable

class UnderLine: UIView {
    
    // MARK: - Types
    
    struct Constants {
        struct ColorPalette {
            static let green = UIColor.init(red: 0.00, green: 0.87, blue: 0.71, alpha: 1.0)
        }
    }
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override class func requiresConstraintBasedLayout() -> Bool {
        return true
    }
    
    
    
    func commonInit() {
        self.backgroundColor = Constants.ColorPalette.green
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }

    
    
    
}








