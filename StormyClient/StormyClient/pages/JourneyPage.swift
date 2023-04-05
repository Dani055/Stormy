//
//  JourneyPage.swift
//  StormyClient
//
//  Created by Nikoleta Dimitrova on 29/03/2023.
//

import SwiftUI
import MapKit

struct JourneyPage: View {
    @State private var searchText = ""
    @EnvironmentObject var weatherRepository: WeatherRepository
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var region = MKCoordinateRegion()
    
    @State private var journeyRecommendation: JourneyRecommendation? = nil
    @State private var showingSheet = false
    @State private var precipationIntensity = 0.0
    @State private var scrollToBottom = false
    
    var locationManager = LocationManager()
    
    
    var body: some View {
        NavigationStack{
            ScrollViewReader{ scrollViewProxy in
                ScrollView{
                    VStack(alignment: .center) {
                        ZStack(alignment: .bottom){
                            Map(coordinateRegion: $region,interactionModes: .all, showsUserLocation: true,  userTrackingMode: .constant(.follow), annotationItems: MapLocations){ marker in
                                MapAnnotation(coordinate: marker.coordinate){
                                    PlaceAnnotationView(title: marker.name)
                                }
                            }
                            .padding(.top)
                            .frame(height: 550)
                            
                            Button(){
                                scrollToBottom.toggle()
                            } label: {
                                Image(systemName: "arrow.down").font(.system(size: 35)).tint(Color.gray).padding(4)
                            }.background(Color.white.opacity(0.6)).cornerRadius(10).padding(.bottom)
                        }
                        
                        VStack{
                            VStack{
                                HStack(alignment: .center){
                                    Text("Journey duration")
                                        .font(.headline)
                                    Spacer()
                                    TimespanPicker(hours: $hours, minutes: $minutes)
                                }.padding(.bottom)
                            
                                Button(){
                                    if(hours >= 0 && minutes > 0){
                                        weatherRepository.getMilimetersOfRain(hours: hours, minutes: minutes){ precipationIntensity in
                                            self.precipationIntensity = precipationIntensity
                                            self.journeyRecommendation = journeyRecommendations.first{recommendation in
                                                recommendation.minimumPrecipation <= precipationIntensity && recommendation.maximumPrecipation >= precipationIntensity
                                            }
                                            showingSheet.toggle()
                                        }
                                    }
//                                    self.precipationIntensity = 7
//                                    self.journeyRecommendation = journeyRecommendations.first{recommendation in
//                                        recommendation.minimumPrecipation <= precipationIntensity && recommendation.maximumPrecipation >= precipationIntensity
//                                    }
//                                    showingSheet.toggle()
                                    
                                } label: {
                                    Text("How to prepare?")
                                }.buttonStyle(.borderedProminent).padding(.bottom, 10)
                                
                            
                            }.padding().background(Color("Grey3")).cornerRadius(10).padding([.top, .leading, .trailing])
                            
                            SafeSpotsList()
                        }
                        
                    
                        
                    }.navigationTitle("Plan a trip").onAppear{
                        guard let location = locationManager.manager.location?.coordinate else {
                            return
                        }
                        region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
                        
                    }
                    
                }.onChange(of: scrollToBottom) { _ in
                    withAnimation{
                        scrollViewProxy.scrollTo("safe spots")
                    }
                }
                
            }
            
        }.sheet(isPresented: $showingSheet) {
            RecommendationSheet(precipationIntensity: $precipationIntensity, journeyRecommendation: $journeyRecommendation)
            
        }.searchable(text: $searchText)
        
    }
}


struct TimespanPicker: View {
    @Binding var hours: Int
    @Binding var minutes: Int
    
    let hoursRange = 0...23
    let minutesRange = 0...59
    
    var body: some View {
        HStack {
            Picker("Hours", selection: $hours) {
                ForEach(hoursRange, id: \.self) { hour in
                    Text("\(hour) h")
                }
            }
            Picker("Minutes", selection: $minutes) {
                ForEach(minutesRange, id: \.self) { minute in
                    Text("\(minute) min")
                }
            }
        }
    }
}


struct JourneyPage_Previews: PreviewProvider {
    static var previews: some View {
        JourneyPage().environmentObject(WeatherRepository())
    }
}
