//
//  SuggestionsSection.swift
//  ChatGPT Reverse Engineered Try 5
//
//  Created by Benyamin Jazayeri on 3/22/25.
//

import SwiftUI

extension SettingsView{
    
    var suggestionsSection: some View{
        Section(Constants.Strings.suggestionsSectionTitle){
            autocomplete
            trending
        }
    }
    
    var autocomplete: some View{
        toggleItem(systemImage: Constants.Strings.autocompleteImageSystemName, title: Constants.Strings.autocompleteTitle, isOn: $autocompleteIsOn)
    }
    
    var trending: some View{
        toggleItem(systemImage: Constants.Strings.trendingImageSystemName, title: Constants.Strings.trendingTitle, isOn: $trendingSearches)
    }
}

extension SettingsView.Constants.Strings{
    static let suggestionsSectionTitle = "Suggestions"
    static let autocompleteImageSystemName = "pencil"
    static let autocompleteTitle = "Autocomplete"
    static let trendingImageSystemName = "chart.line.uptrend.xyaxis"
    static let trendingTitle = "Trending Searches"
}
