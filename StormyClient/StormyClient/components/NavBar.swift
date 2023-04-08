//
//  NavBar.swift
//  StormyClient
//
//  Created by Nikoleta Dimitrova on 29/03/2023.
//

import SwiftUI

struct NavBar: View {
    @State private var selectedPage = 0;
    
    var body: some View {
        TabView(selection: $selectedPage){
            HomePage()
                .tabItem {
                    Image(systemName: "cloud.sun")
                }.tag(0)
            JourneyPage()
                .tabItem {
                    Image(systemName: "map")
                }.tag(1)
            LocationsPage(selectedTab: $selectedPage)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(2)
            ChatPage()
                .tabItem {
                    if(selectedPage == 420){
                        Image("stormy-menu-selected")
                    }else{
                        Image("stormy-menu")
                    }
                    
                }
                .tag(420)
            SettingsPage()
                .tabItem {
                    Image(systemName: "gearshape")
                }.tag(3)
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}
