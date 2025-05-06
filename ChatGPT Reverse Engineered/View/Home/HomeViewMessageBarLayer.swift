//
//  HomeViewMessageBar.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/24/25.
//

import SwiftUI

extension HomeView {

    var messageBarLayer: some View {
        VStack {
            Spacer()
            messageBar
        }
    }

    var messageBar: some View {
        VStack {
            textField
            buttonBar
        }
        .padding(.horizontal)
        .padding(.top)
        .padding(.bottom, Constants.CGFloats.messageBarBottomPadding)
        .background {
            messageBarBackground
        }
    }

    var textField: some View {
        TextField(Constants.Strings.textFieldHint, text: $messageText)
            .focused($isMessageBarFocused, equals: Constants.Bools.textFieldOnFocus)
    }

    var buttonBar: some View {
        HStack {
            fileButton
            searchButton
            reasonButton
            Spacer()
            micButton
            sendButton
        }
    }
    
    var messageBarBackgroundBase: some Shape {
        TopRoundedRectangle(cornerRadius: Constants.CGFloats.messageBarBackgroundBaseCornerRadius)
    }

    var messageBarBackground: some View {
        messageBarBackgroundBase
            .foregroundStyle(.background)
            .overlay {
                messageBarBackgroundBase
                    .stroke(lineWidth: Constants.CGFloats.messageBarBackgroundStrokeLineWidth)
                    .foregroundStyle(Color(.systemGray5))
            }
            .shadow(radius: Constants.CGFloats.messageBarShadowRadius, x: Constants.CGFloats.messageBarShadowXOffSet, y: Constants.CGFloats.messageBarShadowYOffSet)
            .ignoresSafeArea(.all, edges: .bottom)
    }

    var fileButton: some View {
        messageBarButton(systemImage: Constants.Strings.fileButtonImageSystemName)
    }

    var reasonButton: some View {
        messageBarButton(systemImage: Constants.Strings.reasonButtonImageSystemName, title: Constants.Strings.reasonButtonTitle)
    }

    var micButton: some View {
        messageBarButton(systemImage: Constants.Strings.microphoneButtonImageSystemName)
    }

    var searchButton: some View {
        messageBarButton(systemImage: Constants.Strings.searchButtonImageSystemName, title: Constants.Strings.searchButtonTitle)
    }

    var sendButton: some View {
        messageBarButton(systemImage: Constants.Strings.sendButtonImageSystemName){
            Task{
                let sendingText = messageText
                isMessageBarFocused = false
                messageText = ""
                do {
                    try await send(text: sendingText)
                } catch {
                    alertText = error.localizedDescription
                    isAlertPresented = true
                }
            }
        }
        .colorInvert()
    }

    func messageBarButton(
        systemImage: String? = nil, title: String? = nil,
        action: @escaping () -> Void = {}
    ) -> some View {
        Button(action: action) {

            messageBarButtonBody(systemImage: systemImage, title: title)
                .fontWeight(.semibold)
                .font(.footnote)
                .padding(Constants.CGFloats.messageBarBottomPadding)
                .background {
                    messageBarButtonBackground
                }
                .overlay {
                    messageBarButtonOverlay
                }
        }
    }

    func messageBarButtonBody(systemImage: String? = nil, title: String? = nil)
        -> some View
    {
        HStack {
            if let systemImage {
                Image(systemName: systemImage)
                    .imageScale(.large)
            }
            if let title {
                Text(title)
            }
        }
    }

    var messageBarButtonBackground: some View {
        Capsule()
            .foregroundStyle(.background)
    }

    var messageBarButtonOverlay: some View {
        Capsule()
            .stroke(lineWidth: Constants.CGFloats.messageBarButtonStrokeLineWidth)
            .foregroundStyle(Color(.systemGray5))
    }
}

extension HomeView.Constants.Strings {
    static let textFieldHint = "Message ChatGPT"
    static let fileButtonImageSystemName = "plus"
    static let reasonButtonImageSystemName = "lightbulb"
    static let reasonButtonTitle = "Reason"
    static let microphoneButtonImageSystemName = "microphone"
    static let searchButtonImageSystemName = "globe"
    static let searchButtonTitle = "Search"
    static let sendButtonImageSystemName = "arrow.up"
}

extension HomeView.Constants.Bools {
    static let textFieldOnFocus = true
}

extension HomeView.Constants.CGFloats {
    static let messageBarBottomPadding: CGFloat = 8
    static let messageBarBackgroundBaseCornerRadius: CGFloat = 20
    static let messageBarBackgroundStrokeLineWidth: CGFloat = 1
    static let messageBarShadowRadius: CGFloat = 8
    static let messageBarShadowXOffSet: CGFloat = 0
    static let messageBarShadowYOffSet: CGFloat = -0.5
    static let messageBarButtonPadding: CGFloat = 10
    static let messageBarButtonStrokeLineWidth: CGFloat = 1
}
