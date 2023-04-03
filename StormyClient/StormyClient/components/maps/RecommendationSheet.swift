//
//  RecommendationSheet.swift
//  StormyClient
//
//  Created by Yordan Doykov on 03/04/2023.
//

import SwiftUI

struct RecommendationSheet: View {
    @Binding var precipationIntensity: Double
    @Binding var journeyRecommendation: JourneyRecommendation?
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            Capsule()
                    .fill(Color.secondary)
                    .frame(width: 30, height: 3)
                    .padding(10)

            if(journeyRecommendation != nil){
                Text("\(precipationIntensity)")
                Image(journeyRecommendation!.stormyImage).resizable().aspectRatio(contentMode: .fit)
            }
            Spacer()
        }
    
    }
}

struct RecommendationSheet_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationSheet(precipationIntensity: .constant(1.0),journeyRecommendation: .constant(journeyRecommendations[0]))
    }
}
