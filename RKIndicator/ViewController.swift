//
//  ViewController.swift
//  RKIndicator
//
//  Created by Raj on 2/11/16.
//  Copyright © 2016 Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func delay(seconds seconds: Double, completion:()->()) {
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
        
        dispatch_after(popTime, dispatch_get_main_queue()) {
            completion()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var config : RKIndicator.Config = RKIndicator.Config()
        config.size = 120
        config.backgroundColor = UIColor(red:33, green:66, blue:99, alpha:1)
        config.spinnerColor =  UIColor.orangeColor()
        config.titleTextColor = UIColor.blackColor()
        config.spinnerLineWidth = 5.0
        config.foregroundColor = UIColor.blackColor()
        config.foregroundAlpha = 0.5
        
        RKIndicator.setConfig(config)
        
        RKIndicator.show("Searching ", animated: true)
        
        delay(seconds: 3.0) { () -> () in
            RKIndicator.show("Loading...", animated: true)
        }
        
        delay(seconds: 3.0) { () -> () in
            RKIndicator.show("Done...", animated: true)
        }
        delay(seconds: 6.0) { () -> () in
            RKIndicator.hide()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

