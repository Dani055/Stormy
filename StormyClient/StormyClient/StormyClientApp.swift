//
//  StormyClientApp.swift
//  StormyClient
//
//  Created by Yordan Doykov on 25/03/2023.
//

import SwiftUI

@main
struct StormyClientApp: App {
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    
    init() {
       UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("PrimaryColor"))
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(WeatherRepository()).environmentObject(SettingsContainer()).alert(isPresented: $showingAlert) { () -> Alert in
                let primaryButton = Alert.Button.default(Text("Go to settings")) {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }
                let secondaryButton = Alert.Button.cancel(Text("Cancel")) {
                    
                }
                return Alert(title: Text(alertTitle), message: Text(alertMessage), primaryButton: primaryButton, secondaryButton: secondaryButton)
            }
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ENABLE_LOCATION"))) { msg in
                alertTitle = "Enable location"
                alertMessage = "This action requires access to your location. Please enable it in the device's settings"
                showingAlert = true
            }
        }
    }
}
