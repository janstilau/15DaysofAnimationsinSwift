//
//  ViewController.swift
//  navSwitch_5
//
//  Created by jansti on 16/10/27.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Types
    
    struct Constants {
        struct ConstraintIdentifiers {
            static let centerLeftConstraintIdentifier = "centerLeftConstraintIdentifier"
            static let centerRightConstraintIdentifier = "centerRightConstraintIdentifier"
            static let widthConstraintIdentifier = "widthConstraintIdentifier"
        }
        
        struct ColorPalette {
            static let green = UIColor(red:0.00, green:0.87, blue:0.71, alpha:1.0)
        }
    }
    
    enum Side {
        case Left
        case Right
    }
    
    // MARK: - Properties
    
    @IBOutlet weak var optionsBar: UIStackView!
    var underlineView: UnderLine!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUnderLineView()
    }
    
    
    func configureNavBar() {
        self.navigationController?.navigationBar.barTintColor = Constants.ColorPalette.green
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    func setupUnderLineView() {
        
        underlineView = UnderLine()
        self.view.addSubview(underlineView)
        
        let topConstraint = underlineView.topAnchor.constraintEqualToAnchor(optionsBar.bottomAnchor)
        let heightConstraint = underlineView.heightAnchor.constraintEqualToConstant(2)
        
        let leftButton = optionsBar.arrangedSubviews[0]
        let centerLeftConstraint = underlineView.centerXAnchor.constraintEqualToAnchor(leftButton.centerXAnchor)
        centerLeftConstraint.identifier = Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier
        
        // the width constraint will be set value in the func viewdidlayoutsubviews 
        let widthConstraint = underlineView.widthAnchor.constraintEqualToConstant(optionsBar.frame.width / 2.5)
        widthConstraint.identifier = Constants.ConstraintIdentifiers.widthConstraintIdentifier
        
        NSLayoutConstraint.activateConstraints([topConstraint,heightConstraint,widthConstraint,centerLeftConstraint])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for constraint in underlineView.constraints {
            if constraint.identifier == Constants.ConstraintIdentifiers.widthConstraintIdentifier{
                constraint.constant = (optionsBar.frame.width / 2.5)
                self.view.layoutIfNeeded()
            }
        }
    }

    
    
    
    
    
    
   
    
    @IBAction func goLeft(sender: UIButton) {
        
        animateConstrintsForUnderlineView(underlineView,toSide:  .Left)
    }
    
    
    @IBAction func goRight(sender: UIButton) {
        
        animateConstrintsForUnderlineView(underlineView,toSide:  .Right)
    }
    
    func animateConstrintsForUnderlineView(underlineView: UIView, toSide: Side){
        
        switch toSide {
        case Side.Left:
            
            for constraint in underlineView.superview!.constraints {
                
            }
            
            
            
            
        case Side.Right:
            
        default:
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

