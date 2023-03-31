//
//  SelectedWeatherInterval.swift
//  StormyClient
//
//  Created by Yordan Doykov on 31/03/2023.
//

import SwiftUI

struct SelectedWeatherInterval: View {
    let selectedInterval: WeatherIntervals
    let units: String
    
    let dateFormatter = ISO8601DateFormatter()
    let timeFormatter = DateFormatter()
    
    init(interval: WeatherIntervals, units: String) {
        self.selectedInterval = interval
        self.units = units
        dateFormatter.timeZone = TimeZone.current
        timeFormatter.dateFormat = "E, MMM d"
        
    }
    var body: some View {
        let selectedIntervalCode = WeatherCode(rawValue: "\(selectedInterval.values.weatherCode)")
        VStack(alignment: .leading){
            if let date = dateFormatter.date(from: selectedInterval.startTime) {
                Text(timeFormatter.string(from: date)).foregroundColor(Color("Grey1"))
            }
            HStack(){
                if(Calendar.current.component(.hour, from: dateFormatter.date(from: selectedInterval.startTime)!) >= 20){
                    selectedIntervalCode!.nightImage
                }
                else{
                    selectedIntervalCode!.image
                }
                Spacer()
                VStack(alignment: .leading){
                    HStack(alignment: .top){
                        Text("\(Int(selectedInterval.values.temperature))").font(.system(size: 50, weight: .bold))
                        
                        Text("º \(units == "metric" ? "C" : "F")")
                    }
                    
                    Text(selectedIntervalCode!.name)
                }
                Spacer()
            }.padding(.vertical)
        }
    }
}

