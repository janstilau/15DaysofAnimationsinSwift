//
//  ViewController.swift
//  LoadingDots_4_self
//
//  Created by jansti on 16/10/27.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loadingDots: LoadingDots!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let imageView = loadingDots.dotOne
        print(imageView)
    }
    


}

