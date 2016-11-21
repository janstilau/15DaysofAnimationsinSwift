//
//  LoadingDots.swift
//  LoadingDotsAnimation
//
//  Created by Larry Natalicio on 4/19/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//

import UIKit

@IBDesignable
class LoadingDots: UIView {
    
    // MARK: - Properties
    
    @IBOutlet var view: UIView!
    @IBOutlet var dotOne: UIImageView!
    @IBOutlet var dotTwo: UIImageView!
    @IBOutlet var dotThree: UIImageView!
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupNib()// 这里,setupNib是手动加载nib文件,然后加到自己的view上面,完全覆盖添加
        startAnimation()
    }
    
    // MARK: - NSCoding
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupNib()// 从stroyBoard里面加载这个view,是不会自动加载xib的内容的,必须手动加载一次.
        startAnimation()
    }
    
    // MARK: - Nib Loading
    
    func setupNib() {
        self.view = loadNib()
        self.view.frame = self.bounds
        
        registerForNotifications()
        
        self.addSubview(self.view)
    }
    
    func loadNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName(), bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
    
    func nibName() -> String {
        return self.dynamicType.description().componentsSeparatedByString(".").last!
    }
    
    // MARK: - Lifetime
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // MARK: - Convenience
    
    func startAnimation() {
        
        // Make dots very small (practically invsisble) since
        // we want the animation to start from small to big.
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
    
    // MARK: - Notifications
    
    func registerForNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(UIApplicationDelegate.applicationDidBecomeActive(_:)), name: UIApplicationDidBecomeActiveNotification, object: nil)
    }
    
    func applicationDidBecomeActive(notification: NSNotification) {
        startAnimation()
    }
    
}
