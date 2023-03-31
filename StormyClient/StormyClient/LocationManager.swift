//
//  LocationManager.swift
//  StormyClient
//
//  Created by Yordan Doykov on 30/03/2023.
//

import Foundation
import CoreLocation
import SwiftUI


class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
    }

    func requestLocation() {
        manager.requestWhenInUseAuthorization()
        manager.requestLocation()
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

