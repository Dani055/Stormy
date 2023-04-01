//
//  MyLocationModel.swift
//  StormyClient
//
//  Created by Yordan Doykov on 01/04/2023.
//

import Foundation

struct MyLocation: Hashable {
    var city: String
    var time: Date
    var weatherType: String
    var temperature: Int
    var image: String
}

let myLocations = [
    MyLocation(city: "Eindhoven", time: Date(), weatherType: "Cloudy", temperature: 12, image: "cloudy-weather"),
    MyLocation(city: "Sofia", time: Calendar.current.date(byAdding: .hour,value: 1, to: Date())!, weatherType: "Snowy", temperature: -1, image: "snowy-weather"),
    MyLocation(city: "Plovdiv", time: Calendar.current.date(byAdding: .hour,value: 1, to: Date())!, weatherType: "Partly cloudy", temperature: 5, image: "partly-cloudy"),
    MyLocation(city: "Amsterdam", time: Date(), weatherType: "Light rain", temperature: 9, image: "light-rain"),
    MyLocation(city: "Barcelona", time: Date(), weatherType: "Windy", temperature: 20, image: "windy-weather")
]
