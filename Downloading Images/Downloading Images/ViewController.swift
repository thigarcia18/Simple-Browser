//
//  ViewController.swift
//  Downloading Images
//
//  Created by Thiago Garcia on 25/01/18.
//  Copyright © 2018 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bachImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if documentPath.count > 0 {
            
            let documentDirectory = documentPath[0] as? String
            
            let restorePath = documentDirectory! + "/bach.jpg"
            
            bachImageView.image = UIImage(contentsOfFile: restorePath)

        }
        
        /*
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/6/6a/Johann_Sebastian_Bach.jpg")!
        
        let data = try? Data(contentsOf: url)
        
        bachImageView.image = UIImage(data: data!)
        */
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        if documentsPath.count > 0 {
            
            if let documentsDirectory = documentsPath[0] as? String {
                
                let savePath = documentsDirectory + "/bach.jpg"
                
                do {
                    
                    try UIImageJPEGRepresentation(bachImageView.image!, 1)?.write(to: URL(fileURLWithPath: savePath))
                    
                } catch {
                    
                    // error
                    
                }
                
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

