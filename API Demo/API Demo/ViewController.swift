//
//  ViewController.swift
//  API Demo
//
//  Created by Thiago Garcia on 30/01/18.
//  Copyright © 2018 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cityName = "", weatherDescription = ""
    
    @IBOutlet var lblCity: UILabel!
    
    @IBOutlet var lblDescription: UILabel!
    
    @IBOutlet var txtField: UITextField!
    
    @IBAction func search(_ sender: Any) {
        
        if let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=" + txtField.text!.replacingOccurrences(of: " ", with: "-") + "&appid=17f64d544023e57af05980c0568ac2a0") {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                guard let data = data else { return }
                
                do {
                    
                    let city = try JSONDecoder().decode(City.self, from: data)
                    
                    self.cityName = city.name
                    
                    self.weatherDescription = city.weather[0].desc
                    
                } catch {
                    
                    print(error)
                    
                }
                
                DispatchQueue.main.sync(execute: {
                    
                    self.lblCity.text = self.cityName
                    
                    self.lblDescription.text = self.weatherDescription
                    
                })
                
                }.resume()
            
        } else {
            
            lblDescription.text = "Weather information could not be retrieved"
            
        }

    }
    
    struct City: Decodable {
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case weather = "weather"
        }
        let name: String
        let weather: [Weather]
    }
    
    struct Weather: Decodable {
        enum CodingKeys: String, CodingKey {
            case desc = "description"
        }
        let desc: String
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

