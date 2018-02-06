//
//  ViewController.swift
//  Animations
//
//  Created by Thiago Garcia on 08/11/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btn: UIButton!
    
    @IBOutlet var image: UIImageView!
    
    @IBAction func fadeIn(_ sender: Any) {
        
        image.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
            
            self.image.alpha = 1
            
        })
        
    }
    
    @IBAction func slideIn(_ sender: Any) {
        
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2, animations: {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
            
            })
        
    }
    
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1, animations: {
            
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            
        })
        
    }
    
    
    var animatOn = 0
    
    var i = 0
    
    var timer = Timer()
    
    @objc func changeImg() {
        
        image.image = UIImage(named: "frame_\(i)_delay-0.08s.gif")
        
        i += 1
        
        if i > 16 {
            
            i = 0
            
        }
        
    }
    
    @IBAction func next(_ sender: Any) {
        
        if animatOn == 0 {
            
            btn.setTitle("Stop", for: .normal)
            
            animatOn = 1
            
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeImg), userInfo: nil, repeats: true)
            
        } else {
            
            btn.setTitle("Start", for: .normal)
            
            animatOn = 0
            
            i = 0
            
            timer.invalidate()
            
        }
        
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

