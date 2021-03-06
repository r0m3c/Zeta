//
//  OnboardingView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/26/21.
//

import SwiftUI
import FirebaseAuth

struct OnboardingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showOnboardingPart2: Bool = false
    @State var showError: Bool = false
    
    @State var displayName: String = ""
    @State var email: String = ""
    @State var providerID: String = ""
    @State var provider: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(radius: 12)
            
            Text("Welcome to Zeta")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.maroonColor)
            
            Text("Zeta is the number one app for anyone for sharing pictures about their like. We are a loving community and we are happy to have you!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.maroonColor)
                .padding()
            
            // MARK: SIGN IN WITH APPLE
            Button(action: {
                SignInWithApple.instance.startSignInWithAppleFlow(view: self)
            }, label: {
                SignInWithAppleButtonCustom()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
            })
            
            // MARK: SIGN IN WITH GOOGLE
            Button(action: {
                SignInWithGoogle.instance.startSignInWithGoogleFlow(view: self)
            }, label: {
                HStack {
                    Image(systemName: "globe")
                    Text("Sign in with Google")
                }
                .frame(height: 60)
                .frame(maxWidth: .infinity)
                .background(Color.init(.sRGB, red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                .cornerRadius(6)
                .font(.system(size: 23, weight: .medium, design: .default))
            })
            .accentColor(Color.white)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Continue as guest".uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding()
            })
            .accentColor(.black)
        }
        .padding(.all, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.goldColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboardingPart2, onDismiss: {
            self.presentationMode.wrappedValue.dismiss()
        }, content: {
            OnboardingViewPart2(displayName: $displayName, email: $email, providerID: $providerID, provider: $provider)
        })
        .alert(isPresented: $showError, content: {
            return Alert(title: Text("Error signing in!"))
        })
    }
    
    // MARK: FUNCTIONS
    
    func connectToFireBase(name: String, email: String, provider: String, credential: AuthCredential) {
        
        AuthService.instance.logInUserToFirebase(credential: credential) { (returnedProviderID, isError, isNewUser, returnedUserID) in
            
            if let newUser = isNewUser {
                if newUser {
                    // New user
                    if let providerID = returnedProviderID, !isError {
                        // New user, continue to Onboarding Part 2
                        self.displayName = name
                        self.email = email
                        self.providerID = providerID
                        self.provider = provider
                        self.showOnboardingPart2.toggle()
                        
                    } else {
                        // ERROR
                        print("Error getting providerID from logInUserToFirebase")
                        self.showError.toggle()
                    }
                    
                } else {
                    // Existing user
                    if let userID = returnedUserID {
                        // SUCCESS, log in to app
                        AuthService.instance.logInUserToApp(userID: userID) { (success) in
                            if success {
                                print("Successful logging existing user")
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                print("Error logging existing user into our app")
                                self.showError.toggle()
                            }
                        }
                        
                    } else {
                        // ERROR
                        print("Error getting userID from existing user in logInUserToFirebase")
                        self.showError.toggle()
                    }
                }
            } else {
                // ERROR
                print("Error getting info from logInUserToFirebase")
                self.showError.toggle()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
