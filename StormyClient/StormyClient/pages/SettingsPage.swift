//
//  SettingsPage.swift
//  StormyClient
//
//  Created by Yordan Doykov on 29/03/2023.
//

import SwiftUI

struct SettingsPage: View {
    @EnvironmentObject var settingsContainer: SettingsContainer
    
    var body: some View {
        VStack{
            HStack{
                Text("Settings").font(.largeTitle).fontWeight(.semibold)
                Spacer()
            }
            VStack(alignment: .leading){
                Text("Units")
                    .fontWeight(.semibold)
                Picker("Select desired type of unit", selection: $settingsContainer.selectedUnit) {
                    Text("Metric").tag(0)
                    Text("Imprerial").tag(1)
                }
                .pickerStyle(.segmented).onChange(of: settingsContainer.selectedUnit) { value in
                    settingsContainer.changeUnits()
                }
            }
            .padding(.top)
            
            VStack(alignment: .leading){
                Text("Location")
                    .fontWeight(.semibold)
                Picker("Location type", selection: $settingsContainer.selectedLocationType) {
                    Text("Precise").tag(0)
                    Text("General").tag(1)
                }
                .pickerStyle(.segmented)
            }
            .padding(.top)
            
            VStack(alignment: .leading){
                Text("Notifications")
                    .fontWeight(.semibold)
                Picker("Notification type", selection: $settingsContainer.notificationsType) {
                    Text("On").tag(0)
                    Text("Silent").tag(1)
                    Text("Off").tag(2)
                }
                .pickerStyle(.segmented)
            }
            .padding(.top)
            
            VStack(alignment: .leading){
                Text("Hourly forecast")
                    .fontWeight(.semibold)
                HStack{
                    Toggle("Display humidity", isOn: $settingsContainer.displayHumidity)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                HStack{
                    Toggle("Display Precipitation", isOn: $settingsContainer.displayPrecipitation)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                HStack{
                    Toggle("Display wind speed", isOn: $settingsContainer.displayWindSpeed)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                HStack{
                    Toggle("Display wind direction", isOn: $settingsContainer.displayWindDirection)
                        .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
            }
            .padding(.top, 30.0)
            Spacer()
            
            
        }
        .padding(EdgeInsets(top: 20, leading: 35, bottom: 15, trailing: 35))
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage().environmentObject(SettingsContainer())
    }
}
