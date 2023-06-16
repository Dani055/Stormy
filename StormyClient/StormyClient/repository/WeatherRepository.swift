//
//  WeatherRepository.swift
//  StormyClient
//
//  Created by Yordan Doykov on 30/03/2023.
//

import Foundation
import CoreLocation
import SwiftUI

class WeatherRepository: NSObject,ObservableObject, CLLocationManagerDelegate {
    var locationManager = LocationManager()
    private let dateFormatter = ISO8601DateFormatter()
    private let apiKey = "YOUR API KEY HERE"
    
    
    func fetchWeather(units: String, completion: @escaping ([WeatherIntervals]) -> Void){
        locationManager.requestLocation()
        if(locationManager.manager.authorizationStatus == .denied){
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                NotificationCenter.default.post(name:Notification.Name("ENABLE_LOCATION"), object: nil)
            }
            return
        }
        guard let location = locationManager.manager.location?.coordinate else {
            
            return
        }
        let calendar = Calendar.current
        let currentDate = Date()
        
        guard let url = URL(string: "https://api.tomorrow.io/v4/timelines?location=\(location.latitude),\(location.longitude)&fields=temperature&fields=windSpeed&fields=precipitationType&fields=precipitationProbability&fields=precipitationIntensity&fields=weatherCode&units=\(units)&timesteps=1h&startTime=\(dateFormatter.string(from: currentDate))&endTime=\(dateFormatter.string(from: calendar.date(byAdding: .hour, value: 10, to: currentDate)!))&apikey=\(apiKey)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                            
                            let weatherIntervals = weatherResponse.data.timelines.first?.intervals
                            
                            completion(weatherIntervals!)
                        } catch {
                            print(error)
                        }
                    }
        }.resume()
    }
    
    func getMilimetersOfRain(hours: Int, minutes: Int, completion: @escaping (Double) -> Void){
        locationManager.requestLocation()
        if(locationManager.manager.authorizationStatus == .denied){
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                NotificationCenter.default.post(name:Notification.Name("ENABLE_LOCATION"), object: nil)
            }
            return
        }
        guard let location = locationManager.manager.location?.coordinate else {
            return
        }
        let calendar = Calendar.current
        let currentDate = Date()
        var dateComponent = DateComponents()
        if(minutes < 15 && hours <= 0){
            dateComponent.minute = 15
        }
        else{
            dateComponent.minute = minutes
        }
        dateComponent.hour = hours
        

        let arrivalDate = calendar.date(byAdding: dateComponent, to: currentDate)
        print(dateFormatter.string(from: currentDate))
        print(dateFormatter.string(from: arrivalDate!))
        guard let url = URL(string: "https://api.tomorrow.io/v4/timelines?location=\(location.latitude),\(location.longitude)&fields=temperature&fields=windSpeed&fields=precipitationType&fields=precipitationProbability&fields=precipitationIntensity&fields=weatherCode&units=metric&timesteps=15m&startTime=\(dateFormatter.string(from: currentDate))&endTime=\(dateFormatter.string(from: arrivalDate!))&apikey=\(apiKey)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            let decoder = JSONDecoder()
                            let weatherResponse = try decoder.decode(WeatherResponse.self, from: data)
                            var highestPrecipation = 0.0;
                            let weatherIntervals = weatherResponse.data.timelines.first?.intervals
                            
                            for interval in weatherIntervals! {
                                if(interval.values.precipitationIntensity > highestPrecipation){
                                    highestPrecipation = interval.values.precipitationIntensity
                                }
                            }
                            completion(highestPrecipation)
                        } catch {
                            print(error)
                        }
                    }
        }.resume()
    }
    
}
