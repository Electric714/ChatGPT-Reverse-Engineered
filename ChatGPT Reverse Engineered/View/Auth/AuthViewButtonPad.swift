//
//  AuthViewButtonPad.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 4/29/25.
//

import SwiftUI

extension AuthView{
    var buttonPad: some View{
        VStack{
//            continueWithAppleButton
            continueWithGoogleButton
            NavigationLink(destination: EmailAuthView()){
                signUpButton
            }
            NavigationLink(destination: EmailAuthView(isSignup: false)){
                loginButton
            }
        }
        .padding(.top, 8)
        .padding()
        .background(buttonPadBackground)
        
    }
    
    var buttonPadBackground: some View{
        TopRoundedRectangle(cornerRadius: Constants.CGFloat.padBorderRadius)
            .foregroundStyle(.buttonPadBackground)
            .ignoresSafeArea()
    }
    
    var continueWithAppleButton: some View{
        Button{}label: {
            buttonLabelForeground(imageName: Constants.String.appleImageName, text: Constants.String.appleButton)
                .foregroundStyle(.black)
                .background(ButtonLabelBackground.foregroundStyle(.white))
        }
    }
    
    var continueWithGoogleButton: some View{
        Button{
            Task{
                await authViewModel.signinWithGoogle()
            }
        }label: {
            buttonLabelForeground(imageName: Constants.String.googleImageName, text: Constants.String.googleButton)
                .foregroundStyle(.white)
                .background(ButtonLabelBackground.foregroundStyle(.buttonPadSecondary))
        }
    }
    
    var signUpButton: some View{
        
            buttonLabelForeground(text: Constants.String.signupButton)
                .foregroundStyle(.white)
                .background(ButtonLabelBackground.foregroundStyle(.buttonPadSecondary))
        
    }
    
    var loginButton: some View{
        
            buttonLabelForeground(text: Constants.String.loginButton)
                .foregroundStyle(.white)
                .background(borderedButtonLabelBackground)
        
    }
    
    func buttonLabelForeground(imageName: String? = nil, text: String) -> some View{
        HStack{
            Spacer()
            if let imageName{
                Image(imageName)
                    .resizable()
                    .frame(width: Constants.CGFloat.imageSize, height: Constants.CGFloat.imageSize)
            }
            Text(text)
                .font(.title3)
                .fontWeight(.medium)
                .padding(.vertical,12)
            Spacer()
        }
    }
    
    var buttonBase: some Shape{
        RoundedRectangle(cornerRadius: Constants.CGFloat.buttonBaseCornerRadius)
    }
    
    var ButtonLabelBackground: some View{
        buttonBase
    }
    
    var borderedButtonLabelBackground: some View{
        buttonBase
            .stroke(.buttonPadSecondary, lineWidth: Constants.CGFloat.buttonBorderLineWidth)
    }
}

extension AuthView.Constants.String {
    static let appleButton = "Continue with Apple"
    static let googleButton = "Continue with Google"
    static let signupButton = "Sign up"
    static let loginButton = "Log in"
    static let appleImageName = "apple"
    static let googleImageName = "google"
}

extension AuthView.Constants.CGFloat {
    static let buttonBaseCornerRadius: CGFloat = 12
    static let buttonBorderLineWidth: CGFloat = 3
    static let imageSize: CGFloat = 24
    static let padBorderRadius: CGFloat = 30
}
