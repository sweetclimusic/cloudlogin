//
//  SignInWithAppleButtonView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 12/07/2021.
//

import AuthenticationServices
import SwiftUI

struct AppleSignUpView: View {
    var appleButtonStyle: SignInWithAppleButton.Style = .black
    var frameHeight: CGFloat = 50.0
    var body: some View {
        SignInWithAppleButton(.signUp,
                              onRequest: { request in
                                request.requestedScopes = [.fullName, .email]
                              },
                              onCompletion: { result in
                                print(result)
                              }
        )
        .signInWithAppleButtonStyle(.black)
        .cornerRadius(.buttonCornerRadius)
        .frame(height: frameHeight)
    }
}
struct AppleSignInView: View {
    var appleButtonStyle: SignInWithAppleButton.Style = .black
    var frameHeight: CGFloat = 50.0
    var body: some View {
        SignInWithAppleButton(.signIn,
                              onRequest: { request in
                                request.requestedScopes = [.fullName, .email]
                              },
                              onCompletion: { result in
                                print(result)
                              }
        )
        .signInWithAppleButtonStyle(.black)
        .cornerRadius(.buttonCornerRadius)
        .frame(height: frameHeight)
    }
}

struct SignInWithAppleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
        AppleSignUpView()
        AppleSignInView()
        }
    }
}
