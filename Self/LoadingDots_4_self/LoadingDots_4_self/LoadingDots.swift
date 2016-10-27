//
//  LoadingDots.swift
//  LoadingDots_4_self
//
//  Created by jansti on 16/10/27.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

@IBDesignable

class LoadingDots: UIView {
    
    // MARK: - VisibleProperties
    
    @IBInspectable var bgColor: UIColor? {
        
        didSet{
            if bgColor != nil {
                self.backgroundColor = bgColor
            }
        }
    }
    
    // MARK: - Properties
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var dotOne: UIImageView!
    
    @IBOutlet weak var dotTwo: UIImageView!

    @IBOutlet weak var dotThree: UIImageView!
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupNib()
        startAnimation()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupNib()
        startAnimation()
    }
    
    
    // MARK: - NibLoading
    
    func setupNib() {
        self.view = loadNib()
        self.view.frame = self.bounds
        
        registerForNotifications()
        self.addSubview(self.view)
    }
    
    func loadNib() -> UIView {
        
        let bundle = NSBundle.init(forClass: self.dynamicType)
        let nib = UINib.init(nibName: nibName(), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func nibName() -> String {
        return self.dynamicType.description().componentsSeparatedByString(".").last!
    }
    
    
    
    func startAnimation() {
        
        
        dotOne.transform = CGAffineTransformMakeScale(0.01, 0.01)
        dotTwo.transform = CGAffineTransformMakeScale(0.01, 0.01)
        dotThree.transform = CGAffineTransformMakeScale(0.01, 0.01)
        
        UIView.animateWithDuration(0.6, delay: 0.0, options: [.Repeat, .Autoreverse], animations: {
            self.dotOne.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.2, options: [.Repeat, .Autoreverse], animations: {
            self.dotTwo.transform = CGAffineTransformIdentity
            }, completion: nil)
        
        UIView.animateWithDuration(0.6, delay: 0.4, options: [.Repeat, .Autoreverse], animations: {
            self.dotThree.transform = CGAffineTransformIdentity
            }, completion: nil)
        
    }
    
    // MARK: - Notification
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func registerForNotifications(){
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(applicationDidBecomeActive(_:)), name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    func applicationDidBecomeActive(notification: NSNotification) {
        startAnimation()
    }
    
    
}
