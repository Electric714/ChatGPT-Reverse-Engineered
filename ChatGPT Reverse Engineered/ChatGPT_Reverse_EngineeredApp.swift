//
//  ChatGPT_Reverse_EngineeredApp.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 4/26/25.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

@main
struct ChatGPT_Reverse_EngineeredApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authViewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ChatGPTView()
                .environmentObject(authViewModel)
        }
    }
}
