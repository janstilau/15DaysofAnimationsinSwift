//
//  ViewController.swift
//  ProgressAnimation_7
//
//  Created by jansti on 16/10/28.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

struct Gallon {
    
    // MARK: - Properties
    
    let ouncesDrank = 0
    let totalOunces = 128
    
}

class ViewController: UIViewController {

    // MARK: - Types
    
    struct Constants {
        struct ColorPalette {
            static let teal = UIColor(red:0.27, green:0.80, blue:0.80, alpha:1.0)
            static let orange = UIColor(red:0.90, green:0.59, blue:0.20, alpha:1.0)
            static let pink = UIColor(red:0.98, green:0.12, blue:0.45, alpha:1.0)
        }
    }
    
    // MARK: - Properties
    
    @IBOutlet weak var progressView: ProgressView!
    @IBOutlet weak var progressPercentageLabel: UILabel!
    @IBOutlet weak var incrementProgressButton: UIButton!
    let gallon = Gallon()
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureProgressView()
    }
    
    func configureProgressView() {
        progressView.currentValue = CGFloat(gallon.ouncesDrank)
        progressView.range = CGFloat(gallon.totalOunces)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard progressView.currentValue < CGFloat(gallon.totalOunces) else {
            return
        }
        
        // Increment progressView curValue.
        let eightOunceCup = 8
        progressView.currentValue = progressView.currentValue + CGFloat(eightOunceCup)
        
        // Update label based on progressView curValue.
        let percentage = (Double(progressView.currentValue) / Double(gallon.totalOunces))
        progressPercentageLabel.text = numberAsPercentage(percentage)

        
        
    }
    
    func numberAsPercentage(number: Double) -> String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .PercentStyle
        formatter.percentSymbol = ""
        return formatter.stringFromNumber(number)!
    }



}

