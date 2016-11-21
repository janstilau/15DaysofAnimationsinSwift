//
//  ViewController.swift
//  UnderlineAnimation
//
//  Created by Larry Natalicio on 4/20/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    // MARK: - Types
    
    struct Constants {
        struct ConstraintIdentifiers {
            static let centerLeftConstraintIdentifier = "centerLeftConstraintIdentifier"
            static let centerRightConstraintIdentifier = "centerRightConstraintIdentifier"
            static let widthConstraintIdentifier = "widthConstraintIdentifier"
        }// 约束的名字.
        
        struct ColorPalette {
            static let green = UIColor(red:0.00, green:0.87, blue:0.71, alpha:1.0)
        }
    }
    
    enum Side {
        case Left
        case Right
    }
    
    // MARK: - Properties
    
    @IBOutlet var optionsBar: UIStackView!
    
    var underlineView: Underline!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
    }
    
    func configureNavBar() {
        self.navigationController?.navigationBar.barTintColor = Constants.ColorPalette.green
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUnderlineView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /* 
        The frame is not correct when I call (optionsBar.frame.width / 2) in viewWillAppear.
        Therefore, I update the width constraint to this here.
        This also updates the constraint when the view rotates.
        */
        for constraint in underlineView.constraints {
            if constraint.identifier == Constants.ConstraintIdentifiers.widthConstraintIdentifier {
                constraint.constant = (optionsBar.frame.width / 2.5)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func goLeft(sender: UIButton) {
        
        animateContraintsForUnderlineView(underlineView, toSide: .Left)
    }
    
    @IBAction func goRight(sender: UIButton) {
        
        animateContraintsForUnderlineView(underlineView, toSide: .Right)
    }
    
    // MARK: - Convenience
    
    func setupUnderlineView() {
        underlineView = Underline()
        self.view.addSubview(underlineView)
        
        let topConstraint = underlineView.topAnchor.constraintEqualToAnchor(optionsBar.bottomAnchor)
        let heightConstraint = underlineView.heightAnchor.constraintEqualToConstant(2)
        
        let leftButton = optionsBar.arrangedSubviews[0]
        let centerLeftConstraint = underlineView.centerXAnchor.constraintEqualToAnchor(leftButton.centerXAnchor)
        centerLeftConstraint.identifier = Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier
        
        
        
        // The frame is not set here correctly so I update this value again in viewDidLayoutSubviews.
        let widthConstraint = underlineView.widthAnchor.constraintEqualToConstant((optionsBar.frame.width / 2.5))
        widthConstraint.identifier = Constants.ConstraintIdentifiers.widthConstraintIdentifier
        
        NSLayoutConstraint.activateConstraints([topConstraint, heightConstraint, widthConstraint, centerLeftConstraint])
        
        print("add constraint")
        // 这里的topanchor,bottomanchor这些东西,很像UIView的添加约束的分类方法,可能是apple根据分类添加到了自己的系统库里面,不过需要注意的是,这些东西是在iOS9.0之后才使用的.
        // 并且需要调用activeateConstraints才算是添加到了view上,在调用activeateConstraints之前,打印underview.constrains是没有元素的.
        
    }
    
    func animateContraintsForUnderlineView(underlineView: UIView, toSide: Side) {
        
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
            
            for constraint in underlineView.superview!.constraints {
                if constraint.identifier == Constants.ConstraintIdentifiers.centerLeftConstraintIdentifier {
                    
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

