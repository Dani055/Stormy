//
//  SettingsContainer.swift
//  StormyClient
//
//  Created by Yordan Doykov on 30/03/2023.
//

import Foundation

class SettingsContainer: ObservableObject{
    @Published var units = "metric"
    @Published var selectedUnit = 0
    @Published var selectedLocationType = 0
    @Published var notificationsType = 0
    
    @Published var displayHumidity = false
    @Published var displayPrecipitation = true
    @Published var displayWindSpeed = true
    @Published var displayWindDirection = false
    
    func changeUnits(){
        if(units == "metric"){
            units = "imperial"
        }
        else{
            units = "metric"
        }
    }
}
