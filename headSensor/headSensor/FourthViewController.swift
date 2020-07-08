//
//  FourthViewController.swift
//  headSensor
//
//  Created by Hall, Sean M. on 6/1/20.
//  Copyright © 2020 Hall, Sean M. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FourthViewController: UIViewController, CLLocationManagerDelegate {
    
@IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let regionInMeters = 10000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        func checkLocationServices() {
        }
    }
    
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }


    func centerViewOnUserLocation() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: CLLocationDistance(10000), longitudinalMeters: CLLocationDistance(10000))
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
        setupLocationManager()
        checkLocationAuthorization()
    } else {
        //show alert letting user know they have to turn location on
        }
    }
    
        
        func checkLocationAuthorization() {
            switch CLLocationManager.authorizationStatus() {
            
            case.authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
                break
            case .denied:
            //Show alert instructing them how to turn on permissions
                break
            case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            case .restricted:
            //Show an alert letting them know what's up
                break
            case .authorizedAlways:
                break
            
            }
        }


    
        func locationManager( manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion.init(center: center, latitudinalMeters: CLLocationDistance(10000), longitudinalMeters: CLLocationDistance(10000))
                mapView.setRegion(region, animated: true)
        }
        
        
    func locationManager( manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus) {
        func checkLocationAuthoriztion() {
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




}
