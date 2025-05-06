//
//  AuthView.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 4/29/25.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            VStack{
                headline
                buttonPad
            }
        }
    }
    
    struct Constants {
        struct CGFloat{}
        struct String{}
    }
}
