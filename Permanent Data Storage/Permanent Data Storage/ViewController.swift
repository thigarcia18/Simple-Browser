//
//  ViewController.swift
//  Permanent Data Storage
//
//  Created by Thiago Garcia on 01/11/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txtPhone: UITextField!
    
    @IBOutlet var lblPhone: UILabel!
    
    @IBAction func btnSavePressed(_ sender: Any) {
        
        UserDefaults.standard.set(txtPhone.text, forKey: "phone")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let phoneObject = UserDefaults.standard.object(forKey: "phone")
        
        if let phone = phoneObject as? String {
            
            lblPhone.text = "Your phone number is: " + phone
        
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

