//
//  Chat.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import Foundation
import FirebaseFirestore


struct Chat: Identifiable, Codable, Equatable{
    var messages = [Message]()
    @DocumentID var id: String?
    @ServerTimestamp var dateCreated: Timestamp?
    
    struct Message: Identifiable, Codable, Equatable{
        let text: String
        let role: Role
        var id: Int
        
        enum Role: String, Codable{
            case user = "user"
            case assistant = "assistant"
        }
    }
}
