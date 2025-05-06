//
//  HomeView.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/24/25.
//

import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var chatGPT: ChatGPT
    @FocusState var isMessageBarFocused: Bool
    @FocusState var isSearchFocused: Bool
    @State var messageText = Constants.Strings.messageTextDefault
    @State var searchText = Constants.Strings.searchTextDefault
    @State var drawerState: DrawerState = .closed
    @State var isSettingsSheetPresented = Constants.Bools
        .isSettingsSheetPresentedDefault
    @State var isAlertPresented = Constants.Bools.isAlertPresentedDefault
    @State var alertText = Constants.Strings.alertTextDefault
    @FirestoreQuery(
        collectionPath: "users/\(Auth.auth().currentUser!.uid)/chats",
        predicates: [.order(by: "dateCreated", descending: false)])
    var chatCollection: [Chat]

    var body: some View {
        NavigationStack {
            ZStack {
                messagesLayer
                    .onTapGesture {
                        isMessageBarFocused =
                            Constants.Bools.isMessageBarFocusedOnTap
                    }
                messageBarLayer
            }
            .navigationTitle(Constants.Strings.homeNavigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                homeToolbar
            }
        }
        .drawer(state: $drawerState, drawerView: drawerView)
        .sheet(isPresented: $isSettingsSheetPresented) {
            SettingsView(isPresented: $isSettingsSheetPresented)
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text(Constants.Strings.alertTitle),
                message: Text(alertText),
                dismissButton: .default(Text(Constants.Strings.alertDismiss))
            )
        }

    }

    struct Constants {
        struct Strings {
            static let homeNavigationTitle = "ChatGPT"
            static let messageTextDefault = ""
            static let searchTextDefault = ""
            static let alertTitle = "Error"
            static let alertDismiss = "Dismiss"
            static let alertTextDefault = ""
        }
        struct Bools {
            static let isSettingsSheetPresentedDefault = false
            static let isMessageBarFocusedOnTap = false
            static let isAlertPresentedDefault = false
        }
        struct CGFloats {}
    }
}
