//
//  ClickableWeatherInterval.swift
//  StormyClient
//
//  Created by Yordan Doykov on 31/03/2023.
//

import SwiftUI

struct ClickableWeatherInterval: View {
    let interval: WeatherIntervals
    let units: String
    
    let dateFormatter = ISO8601DateFormatter()
    let timeFormatter = DateFormatter()
    
    init(interval: WeatherIntervals, units: String) {
        self.interval = interval
        self.units = units
        dateFormatter.timeZone = TimeZone.current
        timeFormatter.dateFormat = "HH:mm"
        
    }
    var body: some View {
        let weatherCode = WeatherCode(rawValue: "\(interval.values.weatherCode)")
        
        HStack(){
            VStack(){
                if let date = dateFormatter.date(from: interval.startTime) {
                    Text(timeFormatter.string(from: date))
                }
                Spacer()
                if(Calendar.current.component(.hour, from: dateFormatter.date(from: interval.startTime)!) >= 20){
                    weatherCode!.nightSystemIcon.font(.system(size: 24))
                }
                else{
                    weatherCode!.systemIcon.font(.system(size: 24))
                }
                Spacer()
                HStack(){
                    Text("\(Int(interval.values.temperature))")
                    Text("º \(units == "metric" ? "C" : "F")")
                }
            }.padding(.all, 9).font(.system(size: 13))
        }.background(Color("PrimaryColor6")).cornerRadius(20)
    }
}
