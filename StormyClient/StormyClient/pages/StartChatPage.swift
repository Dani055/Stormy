//
//  StartChatPage.swift
//  StormyClient
//
//  Created by Nikoleta Dimitrova on 29/03/2023.
//

import SwiftUI

struct StartChatPage: View {
    var body: some View {
        VStack{
            HStack{
                Text("Chat")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(EdgeInsets(top: 20, leading: 35, bottom: 15, trailing: 35))
            VStack(alignment: .leading){
                VStack(alignment: .center){
                    Text("Ask Stormy")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                    
                    Text("Stormy is here to help you with all of your weather-related questions. \n Don't be shy, ask away!")
                        .font(.system(size: 15))
                        .padding(.bottom, 20)
                        .multilineTextAlignment(.center)
                        .lineSpacing(2)
                    Image("stormy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .padding(.bottom,20)
                    
                    Button(action: {
                        // Add action here
                    }) {
                        Text("Start Chat")
                            .foregroundColor(.black)
                            .frame(width: 280)
                            .padding(.vertical, 12)
                            .background(Color("Grey2"))
                            .cornerRadius(10)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal,46)
                .padding(.vertical, 54)
                .background(.white)
            }
            .cornerRadius(50)
            .padding(EdgeInsets(top: 50 , leading: 20, bottom: 120, trailing: 20))
        }
        .background(Color("Grey2"))
    }
    
    struct StartChatPage_Previews: PreviewProvider {
        static var previews: some View {
            StartChatPage()
        }
    }
}
