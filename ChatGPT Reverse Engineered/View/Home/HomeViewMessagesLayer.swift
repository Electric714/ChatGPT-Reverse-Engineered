//
//  HomeViewMessagesLayer.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/24/25.
//

import SwiftUI

extension HomeView{
    var messagesLayer: some View {
        ScrollView {
            if let chosenChat = chatGPT.chosenChat{
                chatView(chosenChat)
                    .padding()
            } else {
                Color.white
            }
        }
        .animation(nil, value: chatGPT.chosenChat)
    }
    
    func chatView(_ chat: Chat) -> some View {
        VStack(spacing: Constants.CGFloats.chatViewSpacing){
            ForEach(chat.messages){ message in
                messageView(message)
            }
        }
    }
    
    @ViewBuilder
    func messageView(_ message: Chat.Message) -> some View {
        if message.role == .user{
            userMessage(message.text)
        } else if message.role == .assistant{
            assistantMessage(message.text)
        }
    }
    
    func userMessage(_ text: String) -> some View {
        HStack{
            Spacer()
            Text(text)
                .padding()
                .background(Color(.systemGray5))
                .clipShape(RoundedRectangle(cornerRadius: Constants.CGFloats.userMessageClipShapeCornerRadius))
        }
    }
    
    func assistantMessage(_ text: String) -> some View {
        HStack{
            VStack(alignment: .leading,spacing: Constants.CGFloats.assistantMessageSpacing){
                Text(text)
                assistantMessagebar
            }
            Spacer()
        }
    }
    
    var assistantMessagebar: some View {
        HStack(spacing: Constants.CGFloats.assistantMessageBarSpacing){
            copy
            read
            like
            dislike
            reload
        }
    }
    
    var copy: some View {
        assistantMessageButton(systemImage: Constants.Strings.assistantCopyImageSystemName)
    }
    
    var read: some View {
        assistantMessageButton(systemImage: Constants.Strings.assistantReadImageSystemName)
    }
    
    var like: some View {
        assistantMessageButton(systemImage: Constants.Strings.assistantLikeImageSystemName)
    }
    
    var dislike: some View {
        assistantMessageButton(systemImage: Constants.Strings.assistantDislikeImageSystemName)
    }
    
    var reload: some View {
        assistantMessageButton(systemImage: Constants.Strings.assistantReloadImageSystemName)
    }
    
    func assistantMessageButton(systemImage: String, action: @escaping () -> Void = {}) -> some View {
        Button(action: action){
            Image(systemName: systemImage)
                .foregroundStyle(.secondary)
        }
    }
}

extension HomeView.Constants.Strings {
    static let assistantCopyImageSystemName = "square.on.square"
    static let assistantReadImageSystemName = "speaker.wave.2"
    static let assistantLikeImageSystemName = "hand.thumbsup"
    static let assistantDislikeImageSystemName = "hand.thumbsdown"
    static let assistantReloadImageSystemName = "arrow.trianglehead.2.clockwise.rotate.90"
}

extension HomeView.Constants.CGFloats {
    static let chatViewSpacing: CGFloat = 25
    static let userMessageClipShapeCornerRadius: CGFloat = 20
    static let assistantMessageSpacing: CGFloat = 10
    static let assistantMessageBarSpacing: CGFloat = 15
}
