//
//  SignupScreenView.swift
//  CloudLogin
//
//  Created by Ashlee Muscroft on 04/06/2021.
//

import AuthenticationServices
import SwiftUI

struct SignupScreenView: View {
    @Environment(\.scenePhase) var scenePhase
    @Environment(\.presentationMode) var presentationMode
    @State var appActive: Bool = true
    @State var signupScreen: Bool = true
    let pauseView = PauseUIView()
    let appleSignUp = SignInWithAppleButton(.signUp,
                                            onRequest: { request in
                                                request.requestedScopes = [.fullName, .email]
                                            },
                                            onCompletion: { result in
                                                print(result)
                                            }
    )
    
    let appleSignIn = SignInWithAppleButton(.signIn,
                                            onRequest: { request in
                                                request.requestedScopes = [.fullName, .email]
                                            },
                                            onCompletion: { result in
                                                print(result)
                                            }
    )
    var body: some View {
        ZStack {
            if appActive == false {
                pauseView
            } else {
                Image(signupScreen ? "tealtextile" : "purpletextile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        hideKeyboard()
                    }
                VStack {
                    VStack {
                        VStack(alignment: .leading, spacing: 16) {
                            Text(signupScreen ? "Sign Up" : "Sign In")
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                            Text("Access to your AWS cloud date")
                                .modifier(subHeadingModifier())
                            FlatLoginUIView(viewModel: FlatLoginViewModel())
                            GradientButton(labelText: signupScreen ? "Sign Up" : "Sign In")
                            
                            
                            // MARK: Switch login context
                            let prefix: String = signupScreen ?
                                "By signing up you are Agreeing" :
                                "By signing in you are Adhering"
                            Text("\(prefix)  to our Privacy Policy and T&Cs")
                                .modifier(footNoteModifier())
                            //Switch context
                            Button(action: {
                                print("Switching the action")
                                signupScreen.toggle()
                            }) {
                                HStack(spacing: 4) {
                                    Text(signupScreen ?
                                            "Do you have an existing cloud account?" :
                                            "Sign up for a new cloud account."
                                    )
                                    .modifier(footNoteModifier())
                                    GradientText(signupScreen ? "Sign In" : "Sign Up")
                                        .font(.footnote.bold())
                                }
                            }
                            
                            RoundedRectangle(cornerRadius: .buttonCornerRadius)
                                .frame(height: 1)
                                .foregroundColor(Color.init(white: 0.8))
                            
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
                            .frame(height: 50)
                        }.padding(.minEdgePadding)
                    }.modifier(CardBackgroundModifier())
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 52, alignment: .bottom)
                        .opacity(0.7)
                        .padding(.horizontal)
                        .padding(.top, 16) //change to percentage if we have a @EnviornmentObject window
                }
            }
        }.onChange(of: scenePhase){ phase in
            if phase == .active {
                self.appActive = true
            } else {
                self.appActive = false
            }
        }
    }
}

class LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreenView()
    }
    
    #if DEBUG
    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
            UIHostingController(rootView: LoginScreen_Previews.previews)
    }
    #endif
}
