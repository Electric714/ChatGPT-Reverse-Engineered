//
//  AuthViewModel.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 5/5/25.
//

import SwiftUI
import GoogleSignIn
import FirebaseAuth
import Firebase

class AuthViewModel: ObservableObject{
    @Published var user: User?
    
    @MainActor
    func logout() throws{
        try Auth.auth().signOut()
        user = nil
    }
    @MainActor
    func signinWithGoogle() async {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }

            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config

            guard let rootViewController = UIApplication.shared.firstKeyWindow?.rootViewController else {
                print("No root view controller")
                return
            }

            do {
                let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
                let user = result.user
                guard let idToken = user.idToken?.tokenString else {
                    print("Missing ID token")
                    return
                }

                let accessToken = user.accessToken.tokenString
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)

                let authResult = try await Auth.auth().signIn(with: credential)
                self.user = authResult.user
            } catch {
                print("Google sign-in error: \(error.localizedDescription)")
            }
        }
    
    @MainActor
    func signupWithEmail(name: String, email: String, password: String) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        if let user = Auth.auth().currentUser {
            let changeRequest = user.createProfileChangeRequest()
            changeRequest.displayName = name
            
            changeRequest.commitChanges { error in
                if let error = error {
                    print("Failed to update profile: \(error.localizedDescription)")
                } else {
                    print("Profile successfully updated")
                }
            }
        }
        user = result.user
    }
    
    @MainActor
    func loginWithEmail(email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        user = result.user
    }
}

extension UIApplication {
    var firstKeyWindow: UIWindow? {
        return connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first
    }
}
