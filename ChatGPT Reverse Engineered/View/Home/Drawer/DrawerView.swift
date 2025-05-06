//
//  Drawer.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/24/25.
//

import SwiftUI

extension HomeView{
    
    var drawerView: some View{
        NavigationStack{
            VStack{
                ScrollView{
                    VStack(spacing: Constants.CGFloats.drawerSpacing){
                        chatGPTItem
                        exploreItem
                        chats
                    }
                }
                Spacer()
                profile
                    .onTapGesture {
                        isSettingsSheetPresented = Constants.Bools.isSettingsSheetPresentedOnTap
                    }
            }
            .padding()
            .padding(.bottom, Constants.CGFloats.drawerPaddingBottom)
            .searchable(text: $searchText)
            .searchFocused($isSearchFocused)
            .searchPresentationToolbarBehavior(.avoidHidingContent)
            .navigationTitle(Constants.Strings.drawerNavigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .ignoresSafeArea(.all, edges: .bottom)
            .onChange(of: isSearchFocused){
                newValue in
                if newValue{
                    withAnimation{
                        drawerState = .open
                    }
                } else if !newValue && drawerState == .open{
                    withAnimation{
                        drawerState = .closed
                    }
                }
            }
        }
    }
    
    var chatGPTItem: some View{
        item(image: Constants.Strings.chatGPTImageName, title: Constants.Strings.chatGPTTitle)
            .onTapGesture {
                withAnimation{
                    chatGPT.setChosenChat(nil)
                    drawerState = .closed
                }
            }
    }
    
    var exploreItem: some View{
        item(systemImage: Constants.Strings.exploreImageSystemName ,title: Constants.Strings.exploreTitle)
    }
    
    var chats: some View{
        ForEach(chatCollection){ chat in
            let chatTitle = String(chat.messages.first?.text.prefix(20) ?? "New Chat")
            item(title: chatTitle)
                .background{
                    if chat == chatGPT.chosenChat {
                        RoundedRectangle(cornerRadius: Constants.CGFloats.chatItemBackgroundCornerRadius)
                            .foregroundStyle(Color(.systemGray5))
                    }
                }
                .onTapGesture {
                    withAnimation{
                        chatGPT.setChosenChat(chat)
                        drawerState = .closed
                    }
                }
        }
    }
    
    var profile: some View{
        HStack{
            let initials = chatGPT.user.displayName!.prefix(2).uppercased()
            Text(initials)
                .font(.title3)
                .foregroundStyle(.white)
                .padding(14)
                .background{
                    Circle()
                }
            Text(chatGPT.user.displayName!)
                .font(.headline)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: Constants.Strings.settingsButtonImageSystemName)
                .imageScale(.large)
                .foregroundStyle(.secondary)
        }
        .contentShape(Rectangle())
    }
    
    func item(systemImage: String? = nil, image: String? = nil, title: String) -> some View {
        HStack{
            if let systemImage{
                Image(systemName: systemImage)
            } else if let image{
                Image(image)
                    .resizable()
                    .frame(width: Constants.CGFloats.itemImageSize, height: Constants.CGFloats.itemImageSize)
            }
            Text(title)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(8)
        .contentShape(Rectangle())
        
    }
}

extension HomeView.Constants.Strings{
    static let drawerNavigationTitle = "Menu"
    static let chatGPTImageName = "chatgpt"
    static let chatGPTTitle = "ChatGPT"
    static let exploreImageSystemName = "circle.grid.2x2"
    static let exploreTitle = "Explore GPTs"
    static let settingsButtonImageSystemName = "ellipsis"
}

extension HomeView.Constants.CGFloats{
    static let drawerSpacing: CGFloat = 20
    static let drawerPaddingBottom: CGFloat = 10
    static let chatItemBackgroundCornerRadius: CGFloat = 8
    static let itemImageSize: CGFloat = 20
}

extension HomeView.Constants.Bools{
    static let isSettingsSheetPresentedOnTap = true
}
