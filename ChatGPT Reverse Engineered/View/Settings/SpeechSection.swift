//
//  SpeechSection.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import SwiftUI

extension SettingsView{
    
    var speechSection: some View{
        Section(Constants.Strings.speechSectionTitle){
            language
        }
    }
    
    var language: some View{
        menuItem(systemImage: Constants.Strings.speechImageSystemName, title: Constants.Strings.speechLanguageTitle, description: Constants.Strings.speechDescription)
    }
}

extension SettingsView.Constants.Strings{
    static let speechSectionTitle = "Speech"
    static let speechImageSystemName = "globe"
    static let speechLanguageTitle = "Main Language"
    static let speechDescription = "English"
}
