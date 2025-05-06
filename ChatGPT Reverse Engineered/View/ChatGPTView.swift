//
//  ContentView.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 4/26/25.
//

import SwiftUI

struct ChatGPTView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        if let user = authViewModel.user {
            HomeView()
                .environmentObject(ChatGPT(user: user))
        } else {
            AuthView()
        }
    }
}

#Preview {
    ChatGPTView()
        .environmentObject(AuthViewModel())
}
