//
//  EmailView.swift
//  ChatGPT Reverse Engineered
//
//  Created by Benyamin Jazayeri on 4/29/25.
//

import SwiftUI
import FirebaseAuth

struct EmailAuthView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var isSignup = true
    @State var email = Constants.String.emailInitialValue
    @State var password = Constants.String.passwordInitialValue
    @State var alertMessage = ""
    @State var showAlert = false
    @State var isLoading = false
    @State var name = ""
    
    var body: some View {
        ZStack{
            background
            form
            if isLoading{
                ProgressView()
            }
        }
        .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
    }
    
    var form: some View {
        VStack(spacing: Constants.CGFloats.formSpacing){
            title
            fields
            Button{
                Task{
                    isLoading = true
                    if isSignup{
                        do {
                            try await authViewModel.signupWithEmail(name: name ,email: email, password: password)
                        } catch {
                            alertMessage = "\(error.localizedDescription)"
                            showAlert = true
                        }
                    } else{
                        do {
                            try await authViewModel.loginWithEmail(email: email, password: password)
                        } catch {
                            alertMessage = "\(error.localizedDescription)"
                            showAlert = true
                        }
                    }
                    isLoading = false
                }
            }label:{
                buttonLabel
            }
            subtext
                .font(.body)
                .fontWeight(.light)
        }
        .font(.title3)
        .fontWeight(.medium)
        .padding()
    }
    
    var subtext: some View {
        HStack{
            Text(isSignup ? Constants.String.signupSubtext : Constants.String.loginSubtext)
            Text(isSignup ? Constants.String.login :  Constants.String.signup)
                .foregroundStyle(.openAIGreen)
                .onTapGesture {
                    isSignup.toggle()
                }
        }
    }
    
    var title: some View {
        Text(isSignup ? Constants.String.signupTitle : Constants.String.loginTitle)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
    
    var fields: some View {
        VStack{
            if isSignup{
                nameField
            }
            emailField
            passwordField
        }
    }
    
    var nameField: some View {
        TextField("", text: $name)
            .padding(.horizontal)
            .padding(.vertical,Constants.CGFloats.fieldVerticalPadding)
            .background{
                fieldBackground(text: Constants.String.namePlaceholder, value: name)
            }
    }
    
    var emailField: some View {
        TextField("", text: $email)
            .padding(.horizontal)
            .padding(.vertical,Constants.CGFloats.fieldVerticalPadding)
            .background{
                fieldBackground(text: Constants.String.emailPlaceholder, value: email)
            }
    }
    
    var passwordField: some View {
        SecureField("", text: $password)
            .padding(.horizontal)
            .padding(.vertical,Constants.CGFloats.fieldVerticalPadding)
            .background{
                fieldBackground(text: Constants.String.passwordPlaceholder, value: password)
            }
    }
    
    func fieldBackground(text: String, value: String) -> some View{
        base
            .stroke(.openAIGreen, lineWidth: Constants.CGFloats.fieldBackgroundLineWidth)
          .overlay{
              if value.isEmpty{
                  HStack{
                      Text(text)
                          .foregroundColor(.gray)
                          .padding(.leading)
                      Spacer()
                  }
              }
          }
    }
    
    var buttonLabel: some View {
        HStack{
            Spacer()
            Text(Constants.String.buttonText)
                .foregroundStyle(.white)
                .padding(.vertical,Constants.CGFloats.buttonLabelTextPadding)
            Spacer()
        }
        .background(base.foregroundStyle(.openAIGreen))
    }
    
    var base: some Shape {
        RoundedRectangle(cornerRadius: Constants.CGFloats.buttonBaseCornerRadius)
    }
        
    
    var background: some View {
        Color.white.ignoresSafeArea()
    }
    
    struct Constants{
        struct CGFloats{
            static let buttonBaseCornerRadius: CGFloat = 10
            static let buttonLabelTextPadding: CGFloat = 20
            static let fieldBackgroundLineWidth: CGFloat = 2
            static let fieldVerticalPadding: CGFloat = 20
            static let formSpacing: CGFloat = 30
        }
        struct String{
            static let buttonText = "Continue"
            static let passwordPlaceholder = "Password"
            static let emailPlaceholder = "Email"
            static let namePlaceholder = "Name"
            static let signup = "Sign Up"
            static let login = "Login"
            static let signupTitle = "Create an account"
            static let loginTitle = "Welcome back"
            
            static let signupSubtext = "Already have an account?"
            static let loginSubtext = "Don't have an account?"
            
            static let emailInitialValue = ""
            static let passwordInitialValue = ""
        }
    }
}

#Preview {
    EmailAuthView()
        .environmentObject(AuthViewModel())
}
