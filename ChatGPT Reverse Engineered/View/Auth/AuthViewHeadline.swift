//
//  AuthViewHeadline.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 4/29/25.
//

import SwiftUI

extension AuthView{
    var headline: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                headlineText
                headlineCircle
                Spacer()
            }
            Spacer()
        }
    }
    
    var headlineText: some View {
        Text(Constants.String.headlineText)
            .font(.title)
            .fontWeight(.bold)
    }
    
    var headlineCircle: some View {
        Circle()
            .frame(width: Constants.CGFloat.headlineCircleDiameter, height: Constants.CGFloat.headlineCircleDiameter)
    }
}

extension AuthView.Constants.String{
    static let headlineText = "ChatGPT"
}

extension AuthView.Constants.CGFloat{
    static let headlineCircleDiameter: CGFloat = 35
}
