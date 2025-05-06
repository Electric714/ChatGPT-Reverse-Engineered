//
//  VoiceModeSection.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import SwiftUI

extension SettingsView{
    
    var voiceModeSection: some View {
        Section(Constants.Strings.voiceModeSectionTitle){
            voice
            backgroundConversation
        }
    }
    
    var voice: some View {
        navigationItem(systemImage: Constants.Strings.voiceImageSystemName, title: Constants.Strings.voiceTitle, description: Constants.Strings.voiceDescription)
    }
    
    var backgroundConversation: some View {
        toggleItem(systemImage: Constants.Strings.backgroundConversationImageSystemName, title: Constants.Strings.backgroundConversationTitle, isOn: $backgroundConversationIsOn)
    }
}

extension SettingsView.Constants.Strings{
    static let voiceModeSectionTitle = "Voice Mode"
    static let voiceImageSystemName = "waveform"
    static let voiceTitle = "Voice"
    static let voiceDescription = "Sol"
    static let backgroundConversationImageSystemName = "bubble"
    static let backgroundConversationTitle = "Background Conversations"
}
