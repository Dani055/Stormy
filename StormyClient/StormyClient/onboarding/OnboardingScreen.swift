//
//  OnboardingScreen.swift
//  StormyClient
//
//  Created by Yordan Doykov on 28/03/2023.
//

import Foundation
import SwiftUI

struct OnboardingView: View{
    @Binding var showOnboarding: Bool
    @State private var selectedPage = 0
    
    var body: some View{
        VStack{
            HStack{
                Spacer()
                Button{
                    showOnboarding.toggle()
                } label: {
                    Text("Skip")
                }
                .padding([.top, .trailing]).foregroundColor(Color("PrimaryColor5"))
            }
            
            TabView(selection: $selectedPage){
                OnboardingComponent(showOnboarding: $showOnboarding, description:"Always be aware of the weather in your city", image: "onboarding1").tag(0)
                OnboardingComponent(showOnboarding: $showOnboarding, description:"Prepare for your day without any surprises", image: "onboarding2").tag(1)
                OnboardingComponent(showOnboarding: $showOnboarding, description:"Ask for help, travel safely and dress accordingly", image: "onboarding3").tag(2)
            }.padding(.bottom, 50).tabViewStyle(PageTabViewStyle())
            Button{
                if(selectedPage < 2){
                    withAnimation{
                        selectedPage += 1
                    }
                }
                else{
                    showOnboarding.toggle()
                }
            } label: {
                Text("Next").padding(.horizontal, 50)
            }.padding(.bottom, 65).buttonStyle(.borderedProminent).tint(Color("PrimaryColor"))
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

struct OnboardingComponent: View{
    @Binding var showOnboarding: Bool
    var description: String
    var image: String
    
    var body: some View{
            VStack{
                Image(image).resizable().aspectRatio(contentMode: .fit).padding()
                Text(description).font(.system(size: 20))
                    .foregroundColor(Color("PrimaryColor"))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 25)
            }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        OnboardingView(showOnboarding: .constant(true))
    }
}

