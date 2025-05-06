//
//  SettingsView.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Binding var isPresented: Bool
    @State var hapticFeedback = Constants.Bools.hapticFeedbackDefault
    @State var correctSpelling = Constants.Bools.correctSpellingDefault
    @State var autocompleteIsOn = Constants.Bools.autocompleteIsOnDefault
    @State var trendingSearches = Constants.Bools.trendingSearchesDefault
    @State var backgroundConversationIsOn = Constants.Bools.backgroundConversationIsOnDefault
    @State var alertText = Constants.Strings.alertTextDefault
    @State var isAlertPresented = Constants.Bools.isAlertPresentedDefault
    var body: some View {
        NavigationStack {
            List {
                accountSection
                appSection
                speechSection
                voiceModeSection
                suggestionsSection
                aboutSection
                logout
            }
            .navigationTitle(Constants.Strings.navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isPresented = Constants.Bools.isPresentedDefault
                    } label: {

                        Image(
                            systemName: Constants.Strings
                                .closeButtonImageSystemName)
                    }
                }
            }
        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("Error"),
                message: Text(alertText),
                dismissButton: .default(Text("Dismiss"))
            )
        }
    }

    var logout: some View {
        Button {
            do {
                try authViewModel.logout()
            } catch {
                alertText = error.localizedDescription
                isAlertPresented = true
            }
        } label: {
            item(
                systemImage: Constants.Strings.logoutImageSystemName,
                title: Constants.Strings.logoutTitle,
                description: Constants.Strings.logoutDescription)
        }
    }

    struct Constants {
        struct Strings {
            static let navigationTitle = "Settings"
            static let closeButtonImageSystemName = "xmark.circle"
            static let logoutImageSystemName =
                "rectangle.portrait.and.arrow.right"
            static let logoutTitle = "Log out"
            static let logoutDescription = ""
            static let alertTextDefault = ""
        }
        struct CGFloats {}
        struct Bools {
            static let isPresentedDefault = false
            static let hapticFeedbackDefault = true
            static let correctSpellingDefault = true
            static let autocompleteIsOnDefault = true
            static let trendingSearchesDefault = true
            static let backgroundConversationIsOnDefault = true
            static let isAlertPresentedDefault = false
        }
    }
}

#Preview {
    SettingsView(isPresented: .constant(true))
        .environmentObject(AuthViewModel())
}
