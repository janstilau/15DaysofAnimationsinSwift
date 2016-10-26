//
//  ViewController.swift
//  LockScreenSelf
//
//  Created by jansti on 16/10/26.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var topLock: UIImageView!
    
    @IBOutlet weak var bottomLock: UIImageView!

    @IBOutlet weak var lockBorder: UIImageView!
    
    @IBOutlet weak var lockHole: UIImageView!
    
    var isLocked = true
    
    // MARK: - ViewLiftCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if isLocked {
            openLock()
        }else {
            closeLock()
        }
        
    }

    // MARK: - Aniamtions
    
    
    func openLock() {
        
        guard isLocked else{
            return
        }
        
        isLocked = false
        
        UIView.animateWithDuration(0.5, delay: 0.1, options: UIViewAnimationOptions.BeginFromCurrentState, animations: { 
            
            self.lockHole.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            
            }, completion: { _ in
                
                UIView.animateWithDuration(0.5, animations: {
                    
                    let yDelta = self.lockBorder.frame.maxY
                    
                    self.topLock.center.y -= yDelta
                    self.lockHole.center.y -= yDelta
                    self.lockBorder.center.y -= yDelta
                    self.bottomLock.center.y += yDelta
                    
                    }, completion: { _ in
                        
                        self.topLock.hidden = true
                        self.bottomLock.hidden = true
                        self.lockBorder.hidden = true
                        self.lockHole.hidden = true
                })
        })
    }
    
    func closeLock(){
        
        guard !isLocked else {
            return
        }
        
        isLocked = true
        
        self.lockHole.hidden = false
        self.lockBorder.hidden = false
        self.topLock.hidden = false
        self.bottomLock.hidden = false
        
        UIView.animateWithDuration(0.5, delay: 0.1, options: [], animations: { 
            
            let yDelta = self.view.bounds.size.height * 0.5 + self.lockBorder.bounds.size.height * 0.5
            
            self.lockBorder.center.y += yDelta
            self.lockHole.center.y += yDelta
            self.topLock.center.y += yDelta
            self.bottomLock.center.y -= yDelta
            
            
            
            }, completion: { _ in
                
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: {
                    self.lockHole.transform = CGAffineTransformIdentity
                    }, completion: nil)
        })
    }
}

