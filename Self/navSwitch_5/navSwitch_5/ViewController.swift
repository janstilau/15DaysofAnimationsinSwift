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
        
        let widthConstraint = underlineView.widthAnchor.constraintEqualToConstant((optionsBar.frame.width / 2.5))
        widthConstraint.identifier = Constants.ConstraintIdentifiers.widthConstraintIdentifier
        
        NSLayoutConstraint.activateConstraints([topConstraint, heightConstraint, widthConstraint, centerLeftConstraint])
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
    
    
    // 实现证明,如果一个constraint的active设置为false,那么这个constriant会马上从view上面被移除.这个view,应该在它所影响的两个view的最小公父view上.
    func animateConstrintsForUnderlineView(underlineView: UIView, toSide: Side){
        
        switch toSide {
        case .Left:
            
            for constraint in underlineView.superview!.constraints {
                if constraint.identifier == Constants.ConstraintIdentifiers.centerRightConstraintIdentifier {
                    
                    constraint.active = false
                    
                    let leftButton = optionsBar.arrangedSubviews[0]
                    let centerLeftConstraint = underlineView.centerXAnchor.constraintEqualToAnchor(leftButton.centerXAnchor)
                    centerLeftConstraint.identifier = Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier
                    NSLayoutConstraint.activateConstraints([centerLeftConstraint])
                }
            }
        case .Right:
            
            for constraint in underlineView.superview!.constraints{
                if constraint.identifier == Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier{
                    
                    constraint.active = false
                    
                    let rightButton = optionsBar.arrangedSubviews[1]
                    let centerRightConstraint = underlineView.centerXAnchor.constraintEqualToAnchor(rightButton.centerXAnchor)
                    centerRightConstraint.identifier = Constants.ConstraintIdentifiers.centerRightConstraintIdentifier
                    NSLayoutConstraint.activateConstraints([centerRightConstraint])
                }
            }
        }
        
        UIView.animateWithDuration(0.6, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: [], animations: { 
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
}

