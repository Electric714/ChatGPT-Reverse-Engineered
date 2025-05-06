//
//  OpenRouterRequestBody.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/24/25.
//

import Foundation

struct OpenRouterRequestBody: Codable {
    var model = "mistralai/mistral-small-3.1-24b-instruct:free"
    let messages: [Message]
    
    init(fromChat chat: Chat){
        var newMessages = [Message]()
        for message in chat.messages{
            let newMessage = Message(fromChatMesssage: message)
            newMessages.append(newMessage)
        }
        messages = newMessages
    }
    
    struct Message: Codable {
        var role: String
        let content: [Content]
        
        init(fromChatMesssage message: Chat.Message){
            role = message.role.rawValue
            content = [.init(text: message.text)]
        }
        
        
        struct Content: Codable {
            var type = "text"
            let text: String?
        }

    }
    
}




