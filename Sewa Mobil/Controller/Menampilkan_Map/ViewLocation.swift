//
//  ViewLocation.swift
//  Sewa Mobil
//
//  Created by Handoyo on 3/29/18.
//  Copyright © 2018 Handoyo. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class ViewLocation: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    @IBOutlet var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        DispatchQueue.main.async(execute: {
            self.locationManager.stopUpdatingLocation()
            let location = locations.last
            let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!,
                                                  longitude: (location?.coordinate.longitude)!,
                                                  zoom: 18)
            self.mapView.camera = camera
            let imageName = "icon_find_by_locations_small.png"
            let marker = GMSMarker()
            marker.icon = UIImage(named: imageName)
            marker.position = camera.target
            marker.snippet = "Your Here"
            marker.appearAnimation = GMSMarkerAnimation.pop
            marker.map = self.mapView
        })
    }
}
