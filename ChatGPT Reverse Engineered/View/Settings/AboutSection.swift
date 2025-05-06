//
//  AboutSection.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import SwiftUI

extension SettingsView{
    
    var aboutSection: some View{
        Section(Constants.Strings.aboutSectionTitle){
            help
            terms
            privacy
            version
        }
    }
    
    var help: some View{
        Button{} label: {
            item(systemImage: Constants.Strings.helpImageSystemName, title: Constants.Strings.helpTitle)
        }
    }
    
    var terms: some View{
        Button{} label: {
            item(systemImage: Constants.Strings.termsImageSystemName, title: Constants.Strings.termsTitle)
        }
    }
    
    var privacy: some View{
        Button{} label: {
            item(systemImage: Constants.Strings.privacyImageSystemName, title: Constants.Strings.privacyTitle)
        }
    }
    
    var version: some View{
        HStack{
            itemImage(systemName: Constants.Strings.versionImageSystemName)
            itemTitle(Constants.Strings.versionTitle)
            Text(Constants.Strings.versionDescription)
                .lineLimit(1)
                .foregroundStyle(.secondary)
                .font(.caption)
        }
    }
}

extension SettingsView.Constants.Strings{
    static let aboutSectionTitle = "About"
    static let helpImageSystemName = "questionmark.circle"
    static let helpTitle = "Help Center"
    static let termsImageSystemName = "book.pages"
    static let termsTitle = "Terms of Use"
    static let privacyImageSystemName = "lock"
    static let privacyTitle = "Privacy Policy"
    static let versionImageSystemName = "circle.fill"
    static let versionTitle = "ChatGPT for iOS"
    static let versionDescription = "1.2025.070 (13868534596)"
}
