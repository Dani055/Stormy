//
//  RecommendationSheet.swift
//  StormyClient
//
//  Created by Nikoleta Dimitrova on 03/04/2023.
//

import SwiftUI

struct RecommendationSheet: View {
    @Binding var precipationIntensity: Double
    @Binding var journeyRecommendation: JourneyRecommendation?
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color("Grey3").edgesIgnoringSafeArea(.all)
            VStack{
                Capsule()
                    .fill(Color.secondary)
                    .frame(width: 30, height: 3)
                    .padding(10)
                
                if(journeyRecommendation != nil){
                    
                    VStack(alignment: .leading){
                        Text("Highest precipation during your trip: \(String(format:"%.2f", precipationIntensity)) mm/hr").font(.title2).fontWeight(.semibold)
                        
                        
                        VStack{
                            VStack(alignment: .leading){
                                HStack{
                                    Image(journeyRecommendation!.stormyImage).resizable().aspectRatio(contentMode: .fit).frame(width: 140)
                                    Text(journeyRecommendation!.weatherDescription).font(.title3).fontWeight(.semibold).padding(.leading, 5)
                                }
                                
                                Divider()
                                Text("Stormy reccommends:").padding(.top)
                                ScrollView(.vertical){
                                    VStack(alignment: .leading){
                                        ForEach(journeyRecommendation!.gearRecommendations, id: \.gearDescription){gearRecommendation in
                                            
                                            HStack{
                                                gearRecommendation.gearImage.resizable().aspectRatio(contentMode: .fit).frame(width:40)
                                                Text(gearRecommendation.gearDescription).padding(.leading, 7)
                                            }.padding(.top)
                                        }
                                    }
                                    
                                }
                                
                                
                            }.padding()
                            
                        }.background().cornerRadius(10)
                        
                    }
                    
                    
                }
                Button{
                    dismiss()
                } label: {
                    Text("Okay").padding(.top).font(.title3)
                }
                Spacer()
            }.padding()
            
        }
    }
}

struct RecommendationSheet_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationSheet(precipationIntensity: .constant(0),journeyRecommendation: .constant(journeyRecommendations[4]))
    }
}
