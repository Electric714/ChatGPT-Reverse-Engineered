//
//  HomeViewActions.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 5/5/25.
//

import SwiftUI

extension HomeView {
    func send(text: String) async throws{
        //        if let chosenChatIndex {
        //            Task {
        //                await chatGPT.send(chatIndex: chosenChatIndex, text: text)
        //
        //                isFocused = false
        //                text = ""
        //            }
        //        } else {
        //            chatGPT.createNewChat()
        //            chosenChatIndex = chatGPT.chats.count - 1
        //            Task {
        //                let sendingText = text
        //                isFocused = false
        //                text = ""
        //                await chatGPT.send(
        //                    chatIndex: chosenChatIndex!, text: sendingText)
        //
        //            }
        //
        //        }
        //    }
        if chatGPT.chosenChat != nil {
            chatGPT.addMessageToChosenChat(text: text, role: .user)
            let responseText = try await chatGPT.getResponseForChosenChat()
            chatGPT.addMessageToChosenChat(text: responseText, role: .assistant)
            try chatGPT.syncChosenChatToCloud()
        } else {
            let newChat = try chatGPT.createNewChat()
            chatGPT.setChosenChat(newChat)
            chatGPT.addMessageToChosenChat(text: text, role: .user)
            let responseText = try await chatGPT.getResponseForChosenChat()
            chatGPT.addMessageToChosenChat(text: responseText, role: .assistant)
            try chatGPT.syncChosenChatToCloud()
        }
    }
    
    func dismissAlert() {
        isAlertPresented = Constants.Bools.dismissedAlert
    }
}

extension HomeView.Constants.Bools {
    static let dismissedAlert = false
}
