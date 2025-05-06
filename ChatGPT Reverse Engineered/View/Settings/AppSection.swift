//
//  AppSection.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import SwiftUI

extension SettingsView{
    
    var appSection: some View{
        Section(Constants.Strings.appSectionTitle){
            navigationItem(systemImage: Constants.Strings.languageImageSystemName, title: Constants.Strings.languageTitle, description: Constants.Strings.languageDescription)
            menuItem(systemImage: Constants.Strings.colorSchemeImageSystemName, title: Constants.Strings.colorSchemeTitle, description: Constants.Strings.colorSchemeDescription)
            toggleItem(systemImage: Constants.Strings.hapticFeedbackImageSystemName, title: Constants.Strings.hapticFeedbackTitle, isOn: $hapticFeedback)
            toggleItem(systemImage: Constants.Strings.spellingImageSystemName, title: Constants.Strings.spellingTitle, isOn: $correctSpelling)
            menuItem(systemImage: Constants.Strings.mapImageSystemName, title: Constants.Strings.mapTitle, description: Constants.Strings.mapDescription)
        }
    }
}

extension SettingsView.Constants.Strings{
    static let appSectionTitle = "App"
    static let languageImageSystemName = "globe"
    static let languageTitle = "App Language"
    static let languageDescription = "English"
    static let colorSchemeImageSystemName = "sun.max"
    static let colorSchemeTitle = "Color Scheme"
    static let colorSchemeDescription = "System"
    static let hapticFeedbackImageSystemName = "iphone.radiowaves.left.and.right"
    static let hapticFeedbackTitle = "Haptic Feedback"
    static let spellingImageSystemName = "character.cursor.ibeam"
    static let spellingTitle = "Correct Spelling Automatically"
    static let mapImageSystemName = "map"
    static let mapTitle = "Map Provider"
    static let mapDescription = "Apple Maps"
}
