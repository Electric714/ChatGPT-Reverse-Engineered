//
//  ChatGPT.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 4/26/25.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import Firebase
import FirebaseFirestore

class ChatGPT: ObservableObject {
    @Published var user: User
    @Published var chosenChat: Chat?
    init(user: User) {
        self.user = user
    }
    
    @MainActor
    func addMessageToChosenChat(text: String, role: Chat.Message.Role){
        if chosenChat != nil{
            chosenChat!.messages.append(.init(text: text, role: role,id: chosenChat!.messages.count))
        }
    }
    
    func getResponseForChosenChat() async throws -> String{
        if let chosenChat{
          
            let apiKey: String = try Configuration.value(for: "API_KEY")
                let endpoint = URL(string: "https://openrouter.ai/api/v1/chat/completions")!
                var request = URLRequest(url: endpoint)
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.setValue("Bearer: \(apiKey)", forHTTPHeaderField: "Authorization")
                request.httpMethod = "POST"
                request.httpBody = try JSONEncoder().encode(OpenRouterRequestBody(fromChat: chosenChat))
                let (data, _) = try await URLSession.shared.data(for: request)
                
                let response = try JSONDecoder().decode(OpenRouterResponse.self, from: data)
                
                let responseText = response.choices[0].message.content
                
                return responseText
        }
        return ""
    }
    
    @MainActor
    func setChosenChat(_ chat: Chat?){
        chosenChat = chat
    }
    
    func createNewChat() throws -> Chat {
        var newChat = Chat()
        let chatRef = try Firestore.firestore().collection("users").document(user.uid).collection("chats").addDocument(from: newChat)
        newChat.id = chatRef.documentID
        return newChat
    }
    
    func syncChosenChatToCloud() throws{
        if let id = chosenChat?.id {
            try Firestore.firestore().collection("users").document(user.uid).collection("chats").document(id).setData(from: chosenChat)
        }
    }
}



