//
//  ViewController.swift
//  Log In Demo
//
//  Created by Thiago Garcia on 23/01/18.
//  Copyright © 2018 iGarcia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var logOutButton: UIButton!
    
    @IBOutlet var lbl: UILabel!
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var txtField: UITextField!
    
    var isLoggedIn = false
    
    @IBAction func btnLogIn(_ sender: Any) {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        if isLoggedIn {
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            
            do {
                
                let results = try context.fetch(request)
                
                if results.count > 0 {
                    
                    for result in results as! [NSManagedObject] {
                        
                        result.setValue(txtField.text, forKey: "name")
                        
                        do {
                            
                            try context.save()
                            
                        } catch {
                            
                            print("Unable to save new username")
                            
                        }
                        
                    }
                 
                    lbl.text = "Hi there " + txtField.text! + "!"
                    
                }
                
            } catch {
                
                print("Update username failed")
                
            }
            
        } else {
            
            let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            
            newValue.setValue(txtField.text, forKey: "name")
            
            do {
                
                try context.save()
                
                txtField.alpha = 0
                
                button.setTitle("Update username", for: [])
                
                lbl.alpha = 1
                
                lbl.text = "Hi there " + txtField.text! + "!"
                
                isLoggedIn = true
                
                txtField.alpha = 1
                
                logOutButton.alpha = 1
                
            } catch {
                
                print("Failed to save")
                
            }
            
        }
        
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do {
            
            let results = try context.fetch(request)
            
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    
                    context.delete(result)
                    
                    do {
                        
                        try context.save()
                        
                    } catch {
                        
                        print("Individual delete failed")
                        
                    }
                    
                }
                
                lbl.alpha = 0
                
                logOutButton.alpha = 0
                
                txtField.alpha = 0
                
                button.setTitle("Login", for: [])
                
                isLoggedIn = false
                
                txtField.alpha = 1
                
            }
            
        } catch {
            
            print("Delete failed")
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(request)
            
            for result in results as! [NSManagedObject] {
                
                if let username = result.value(forKey: "name") as? String {
                    
                    txtField.alpha = 0
                    
                    button.setTitle("Update username", for: [])
                    
                    lbl.alpha = 1
                    
                    logOutButton.alpha = 1
                    
                    lbl.text = "Hi there " + username + "!"
                    
                }
                
            }
            
        } catch {
            
            print("Request failed")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

