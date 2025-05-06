//
//  HomeViewToolbar.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/24/25.
//

import SwiftUI

extension HomeView{
    
    @ToolbarContentBuilder
    var homeToolbar: some ToolbarContent{
        ToolbarItem(placement: .topBarLeading){
            Button {
                withAnimation{
                    drawerState = .half
                    messageText = Constants.Strings.messageBarTextOnLeadingPressed
                    isMessageBarFocused = Constants.Bools.isMessageBarFocusedOnLeadingPressed
                }
            } label: {
                Image(systemName: Constants.Strings.leadingButtonImageSystemName)
                    .fontWeight(.semibold)
            }
        }
        ToolbarItem(placement: .topBarTrailing){
            Button {
                chatGPT.setChosenChat(nil)
            } label: {
                Image(systemName: Constants.Strings.trailingButtonImageSystemName)
                    .fontWeight(.semibold)
            }
        }
    }
}

extension HomeView.Constants.Strings{
    static let leadingButtonImageSystemName = "line.3.horizontal"
    static let trailingButtonImageSystemName = "square.and.pencil"
    static let messageBarTextOnLeadingPressed = ""
}

extension HomeView.Constants.Bools{
    static let isMessageBarFocusedOnLeadingPressed = false
}
