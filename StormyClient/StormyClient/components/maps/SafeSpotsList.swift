//
//  SafeSpotsList.swift
//  StormyClient
//
//  Created by Yordan Doykov on 04/04/2023.
//

import SwiftUI

struct SafeSpotsList: View {
    var locationManager = LocationManager()
    
    var body: some View {
        VStack(alignment: .leading){
            Section{
                ForEach(MapLocations.sorted(by: {$0.mw < $1.mw})){ location in
                    Divider()
                    HStack{
                        VStack(alignment: .leading){
                            Text(location.name)
                            Text(location.street).font(.system(size: 13)).fontWeight(.thin)
                        }
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("\(location.mw) min").font(.system(size: 15)).fontWeight(.semibold)
                            Text("from you").font(.system(size: 13)).fontWeight(.thin)
                        }
                        
                    }
                }
            } header: {
                Text("Safe spots near you")
                    .fontWeight(.semibold).foregroundColor(.black).padding(.bottom, 5).font(.system(size: 18)).id("safe spots")
            }
            
        }.padding().background(Color("Grey3")).cornerRadius(10).padding([.top, .leading, .trailing])
    }
}

struct SafeSpotsList_Previews: PreviewProvider {
    static var previews: some View {
        SafeSpotsList()
    }
}
