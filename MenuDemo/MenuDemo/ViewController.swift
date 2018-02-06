//
//  ViewController.swift
//  MenuDemo
//
//  Created by Thiago Garcia on 31/10/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    @IBAction func btnCamera(_ sender: Any) {
        
        timer.invalidate()
        
    }
    
    @objc func precessTimer() {
    
        print("A second has passed...")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer  = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.precessTimer), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

