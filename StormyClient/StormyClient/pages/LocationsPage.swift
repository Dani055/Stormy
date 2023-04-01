//
//  LocationsPage.swift
//  StormyClient
//
//  Created by Yordan Doykov on 29/03/2023.
//

import SwiftUI

struct LocationsPage: View {
    @State private var searchText = ""
    @Binding var selectedTab: Int
    let timeFormatter = DateFormatter()
    
    init(selectedTab: Binding<Int>) {
        self._selectedTab = selectedTab
        timeFormatter.dateFormat = "HH:mm"
        
    }
    
    var searchResults: [MyLocation] {
        if searchText.isEmpty {
            return myLocations
        } else {
            return myLocations.filter { $0.city.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                VStack{
                    ForEach(searchResults, id: \.self){ location in
                        HStack{
                            HStack(alignment: .top){
                                VStack(alignment: .leading){
                                    Text(location.city)
                                        .fontWeight(.semibold)
                                    Text(timeFormatter.string(from: location.time)).font(.system(size: 13))
                                         Text(location.weatherType).font(.system(size: 13)).fontWeight(.light).padding(.top)
                                }
                                Spacer()
                                VStack{
                                    Image(location.image).resizable().aspectRatio(contentMode: .fit).frame(width: 80)
                                    HStack(alignment: .top){
                                        Text("\(location.temperature)")
                                        
                                        Text("º C")
                                    }.font(.system(size: 13))
                                }
                            }.padding(.all, 14).background(Color("PrimaryColor7"))
                        }.cornerRadius(15).onTapGesture {
                            selectedTab = 0
                        }
                    }
                    Spacer()
                }.navigationTitle("Locations").padding(EdgeInsets(top: 15, leading: 16, bottom: 15, trailing: 16))
            }
            
        }.searchable(text: $searchText)
    }
}

struct LocationsPage_Previews: PreviewProvider {
    static var previews: some View {
        LocationsPage(selectedTab: .constant(0))
    }
}
