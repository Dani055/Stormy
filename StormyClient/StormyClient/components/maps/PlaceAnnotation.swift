//
//  PlaceAnnotation.swift
//  StormyClient
//
//  Created by Yordan Doykov on 03/04/2023.
//

import SwiftUI

struct PlaceAnnotationView: View {
    @State private var showTitle = true
    
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.callout)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(10)
                .opacity(showTitle ? 0 : 1)
            ZStack{
                Image(systemName: "circle.fill")
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(.green)
                Image(systemName: "house.fill")
                    .imageScale(.large)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                showTitle.toggle()
            }
        }
    }
}

struct PlaceAnnotation_Previews: PreviewProvider {
    static var previews: some View {
        PlaceAnnotationView(title: "Maikati")
    }
}
