//
//  StormyClientApp.swift
//  StormyClient
//
//  Created by Yordan Doykov on 25/03/2023.
//

import SwiftUI

@main
struct StormyClientApp: App {
    init() {
       UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("PrimaryColor"))
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
