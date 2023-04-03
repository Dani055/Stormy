//
//  MapLocations.swift
//  StormyClient
//
//  Created by Yordan Doykov on 03/04/2023.
//

import Foundation
import MapKit
import SwiftUI

struct MapLocation: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


let MapLocations = [
    MapLocation(name: "Fontys", latitude: 51.451280085729536, longitude: 5.479830842508337),
    MapLocation(name: "De bijenkorf", latitude: 51.441768123088714, longitude: 5.477381885404868),
    MapLocation(name: "TU/e", latitude: 51.44868332980911, longitude: 5.490714798327613)
]
