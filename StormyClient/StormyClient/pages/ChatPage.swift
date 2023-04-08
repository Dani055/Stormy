//
//  ChatPage.swift
//  StormyClient
//
//  Created by Nikoleta Dimitrova on 02/04/2023.
//

import SwiftUI
import Combine

struct ChatPage: View {

    @State var messageText: String = ""
    @State var chatMessages: [ChatMessages] = []
    let openAIService = OpenAIService()
    @State var cancellables =  Set<AnyCancellable>()

    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    LazyVStack {
                        ForEach(chatMessages, id:\.id){ message in
                            messageView(message:message)
                        }
                    }
                }
                
                HStack{
                    //text field
                    TextField("Ask me a question...", text: $messageText)
                        .padding()
                        .background(.gray.opacity(0.1))
                        .cornerRadius(15)
                    
                    Button{
                        sendMessage()
                    } label: {
                        Text("Send")
                            .foregroundColor(Color("AccentColor"))
                            .padding()
                            .cornerRadius(12)
                    }
                }
            }
            .navigationBarTitle("Ask Stormy", displayMode: .inline)
            .padding()
            .onAppear {
                
                // Add a static message when the page is open
                let staticMessage = ChatMessages.sampleMessage
                chatMessages.append(contentsOf: staticMessage)
            }
        }
    }
    
    //the design of the messages
    func messageView(message: ChatMessages) -> some View{
        HStack{
            if message.sender == .me {Spacer()}
            Text(message.content)
                .foregroundColor(message.sender == .me ? .white : .black)
                .padding()
                .background(message.sender == .me ? Color("AccentColor") : .gray.opacity(0.1))
                .cornerRadius(18)
            if message.sender == .stormy {Spacer()}
        }
    }
    
    func sendMessage() {
        let myMessage = ChatMessages(id: UUID().uuidString, content: messageText, dateCreated: Date(), sender: .me)
        chatMessages.append(myMessage)
        openAIService.sendMessage(message: messageText).sink { completion in
            //
        } receiveValue: { response in
            guard let textResponse = response.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines.union(.init(charactersIn: "\""))) else { return }
            let stormyMessage = ChatMessages(id: response.id, content: textResponse, dateCreated: Date(), sender: .stormy)
            chatMessages.append(stormyMessage)
        }
        .store(in: &cancellables)
        messageText = ""
        print(messageText)
    }
}

struct ChatMessages{
    let id: String
    let content: String
    let dateCreated: Date
    let sender: MessageSender
}

enum MessageSender {
    case me
    case stormy
}

extension ChatMessages{
    static let sampleMessage = [
        ChatMessages(id: UUID().uuidString, content: "Hi, I'm Stormy! I'm here to help you plan your day based on the weather outside. You can ask me questions like 'What's the weather like today in Eindhoven?' or 'What should I wear if it's raining?' Don't be shy, ask away!", dateCreated: Date(), sender: .stormy)
    ]
}

struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}
