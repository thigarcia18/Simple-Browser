//
//  ViewController.swift
//  Egg Timer
//
//  Created by Thiago Garcia on 31/10/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblTimer: UILabel!
    
    var timer = Timer()
    
    var time = 210
    
    @objc func timePassing() {
        
        if time > 0 {
            
            time -= 1
            
            lblTimer.text = String(time)
            
        } else {
            
            timer.invalidate()
            
        }
        
    }

    @IBAction func btnPause(_ sender: Any) {
        
        timer.invalidate()
        
    }
    
    @IBAction func btnPlay(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timePassing), userInfo: nil, repeats: true)
    
    }
    
    @IBAction func btnMinus10(_ sender: Any) {
        
        if time > 10 {
            
            time -= 10
            
            lblTimer.text = String(time)
            
        }
        
    }
    
    @IBAction func btnPlus10(_ sender: Any) {
        
        time += 10
        
        lblTimer.text = String(time)
        
    }
    
    @IBAction func btnReset(_ sender: Any) {
        
        time = 210
        
        lblTimer.text = String(time)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

