//
//  HomePage.swift
//  StormyClient
//
//  Created by Yordan Doykov on 29/03/2023.
//

import SwiftUI

struct HomePage: View {
    @EnvironmentObject var weatherRepository: WeatherRepository
    @EnvironmentObject var settingsContainer: SettingsContainer
    @State var weatherIntervals: [WeatherIntervals] = []
    @State var selectedInterval: WeatherIntervals? = nil
    let dateFormatter = ISO8601DateFormatter()
    let timeFormatter = DateFormatter()
    
    init() {
        dateFormatter.timeZone = TimeZone.current
        timeFormatter.dateFormat = "HH:mm"
        
    }
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading){
                Text("Stormy's forecast").font(.largeTitle).fontWeight(.semibold).multilineTextAlignment(.leading).padding(.bottom, 9.0)
                Text("Current Location").font(.title).padding(.bottom, 10.0)
            }
            
            if(weatherIntervals.isEmpty){
                
                Text("No weather info available yet.\nTap on refresh to reload.\nMake sure you have enabled location permissions for the app.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                Button("Refresh", action: {
                    weatherRepository.fetchWeather(units: settingsContainer.units){ intervals in
                        selectedInterval = intervals[0]
                        weatherIntervals = intervals
                    }
                })
            }
            
            else{
                //Currently selected interval
                if(selectedInterval != nil){
                    SelectedWeatherInterval(interval: selectedInterval!, units: settingsContainer.units)
                }
                
                //Hourly forecast
                VStack(alignment: .leading){
                    Text("Hourly forecast").font(.title3)
                        .fontWeight(.bold)
                    
                    Divider().padding(.bottom)
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 10){
                            ForEach(weatherIntervals, id: \.startTime) { interval in
                                
                                ClickableWeatherInterval(interval: interval, units: settingsContainer.units)
                                    .overlay(interval.startTime == selectedInterval!.startTime ? nil : Color.white.opacity(0.5))
                                    .onTapGesture {
                                        selectedInterval = interval
                                    }
                                
                            }
                        }
                        .frame(maxHeight: 110).padding(.bottom)
                        
                    }
                    
                    
                    if(selectedInterval != nil){
                        VStack{
                            HStack{
                                HStack{
                                    HStack{
                                        ZStack{
                                            Image(systemName: "umbrella.fill").font(.system(size: 24))
                                                .padding(.all, 6).foregroundColor(Color.indigo)
                                        }.frame(minWidth: 40).background(Color.white).cornerRadius(10)
                                        
                                        Text("Rainfall")
                                    }
                                    Spacer()
                                    Text("\(String(format: "%.2f", selectedInterval!.values.precipitationIntensity))\(settingsContainer.units == "metric" ? "mm/hr" : "in/hr")")
                                }
                                .padding(.all, 11.0)
                            }.background(Color("Grey2")).cornerRadius(10)
                            
                            
                            HStack{
                                HStack{
                                    HStack{
                                        ZStack{
                                            Image(systemName: "wind").font(.system(size: 24))
                                                .padding(.all, 6).foregroundColor(Color.gray)
                                        }.frame(minWidth: 40).background(Color.white).cornerRadius(10)
                                        
                                        Text("Wind")
                                    }
                                    Spacer()
                                    Text("\(Int(selectedInterval!.values.windSpeed))\(settingsContainer.units == "metric" ? "m/s" : "mph")")
                                }
                                .padding(.all, 11.0)
                            }.background(Color("Grey2")).cornerRadius(10)
                            
                            HStack{
                                HStack{
                                    HStack{
                                        ZStack{
                                            Image(systemName: "drop.fill").font(.system(size: 24))
                                                .padding(.all, 6).foregroundColor(Color.blue)
                                        }.frame(minWidth: 40).background(Color.white).cornerRadius(10)
                                        
                                        Text("Chance to rain")
                                    }
                                    Spacer()
                                    Text("\(selectedInterval!.values.precipitationProbability)%")
                                }
                                .padding(.all, 11.0)
                            }.background(Color("Grey2")).cornerRadius(10)
                        }.font(.system(size: 12))
                    }
                }
                
            }
        }.padding(EdgeInsets(top: 20, leading: 35, bottom: 15, trailing: 35)).onAppear {
//            weatherRepository.fetchWeather(units: settingsContainer.units){ intervals in
//                selectedInterval = intervals[0]
//                weatherIntervals = intervals
//                
//            }
        }
        
    }
}
struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage().environmentObject(WeatherRepository()).environmentObject(SettingsContainer())
    }
}
