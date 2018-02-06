//
//  ViewController.swift
//  Whats the weather
//
//  Created by Thiago Garcia on 07/11/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var lblWeather: UILabel!
    
    @IBOutlet var txtWeather: UITextField!
    
    @IBAction func btnWeather(_ sender: Any) {
    
        if let url = URL(string: "https://www.weather-forecast.com/locations/" + txtWeather.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
            
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                
                data, response, error in
                
                var message = ""
                
                if error != nil {
                    
                    print(error!)
                    
                } else {
                    
                    if let unwrappedData = data {
                        
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        
                        var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                        
                        if let contentArray = dataString?.components(separatedBy: stringSeparator){
                            
                            if contentArray.count > 1 {
                                
                                stringSeparator = "</span>"
                                
                                let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                                
                                if newContentArray.count > 1 {
                                    
                                    message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                    
                                    print(message)
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
                if message == "" {
                    
                    message = "The weather could not be found. Please try again."
                    
                }
                
                DispatchQueue.main.sync(execute: {
                    
                    self.lblWeather.text = message
                    
                })
                
            }
            
            task.resume()
            
        } else {
         
            txtWeather.text = "The weather could not be found. Please try again."
            
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

