//
//  CurrentWeatherViewController.swift
//  Weathery
//
//  Created by Thiago Garcia on 31/01/18.
//  Copyright © 2018 iGarcia. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet var cityTextLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    
    let forecastAPIKey = "40559236bb6c13accc6a1a0a6e5cc6c9"
    let coordinate: (lat: Double, long: Double) = (37.8267,-122.4233)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let forecastService = ForecastService(APIKey: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
            
            if let currentWeather = currentWeather {
                
                DispatchQueue.main.async {
                    
                    if let temperature = currentWeather.temperature {
                        
                        self.temperatureLabel.text = String(format:"%.0f", temperature.rounded()) + "°"
                        
                    } else {
                        
                        self.temperatureLabel.text = "-"
                        
                    }
                }
            }
        }
    }
}
