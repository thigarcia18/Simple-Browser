//
//  ViewController.swift
//  Finding the User
//
//  Created by Thiago Garcia on 10/11/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        
        let longitude = userLocation.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.03
        
        let longDelta: CLLocationDegrees = 0.03
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)
        
        //get address
        CLGeocoder().reverseGeocodeLocation(userLocation) {
            (placemarks, error) in
            
            if error != nil {
                
                print(error!)
                
            } else {
                
                if let placemark = placemarks?[0] {
                    
                    var subThoroughfare = ""
                    
                    if placemark.subThoroughfare != nil {
                        
                        subThoroughfare = placemark.subThoroughfare!
                        
                    }
                    
                    var thoroughFare = ""
                    
                    if placemark.thoroughfare != nil {
                        
                        thoroughFare = placemark.thoroughfare!
                        
                    }
                    
                    var subLocality = ""
                    
                    if placemark.subLocality != nil {
                        
                        subLocality = placemark.subLocality!
                        
                    }
                    
                    var subAdminArea = ""
                    
                    if placemark.subAdministrativeArea != nil {
                        
                        subAdminArea = placemark.subAdministrativeArea!
                        
                    }
                    
                    var postalCode = ""
                    
                    if placemark.postalCode != nil {
                        
                        postalCode = placemark.postalCode!
                        
                    }
                    
                    var country = ""
                    
                    if placemark.country != nil {
                        
                        country = placemark.country!
                        
                    }
                    
                    print(subThoroughfare + " " + thoroughFare + "\n" + subLocality + "\n" + subAdminArea + "\n" + postalCode + "\n" + country)
                    
                }
                
            }
            
        }
        
    }
    
}

