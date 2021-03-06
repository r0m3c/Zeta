//
//  SettingsView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/24/21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showSignOutError: Bool = false
    
    @Binding var userDisplayName: String
    @Binding var userBio: String
    @Binding var userProfilePicture: UIImage
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    // MARK: SECTION 1: ZETA
                    GroupBox(label: SettingsLabelView(labelText: "Zeta", labelImage: "dot.radiowaves.left.and.right"), content: {
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(12)
                            
                            Text("Zeta is the number one app for anyone for sharing pictures about their like. We are a loving community and we are happy to have you!")
                                .font(.footnote)
                        }
                    })
                    .padding()
                    
                    // MARK: SECTION 2: PROFILE
                    GroupBox(label: SettingsLabelView(labelText: "Profile", labelImage: "person.fill"), content: {
                        
                        NavigationLink(
                            destination: SettingsEditTextView(submissionText: userDisplayName, title: "Display Name", description: "You can edit your display name here. This will be seen by other users.", placeholder: "Add your diplay name here...", settingsEditTextOption: .displayName, profileText: $userDisplayName),
                            label: {
                                SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.maroonColor)
                            })
                        
                        NavigationLink(
                            destination: SettingsEditTextView(submissionText: userBio, title: "Profile Bio", description: "Your bio is where you can let other users know a little about you.", placeholder: "Your bio goes here...", settingsEditTextOption: .bio, profileText: $userBio),
                            label: {
                                SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.maroonColor)
                            })
                        
                        NavigationLink(
                            destination: SettingsEditImageView(title: "Profile Picture", description: "Your profile picture will be shown on your profile and on your posts. Most users make it an image of themselves. ", selectedImage: userProfilePicture, profileImage: $userProfilePicture),
                            label: {
                                SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.maroonColor)
                            })
                        
                        Button(action: {
                            signOut()
                        }, label: {
                            SettingsRowView(leftIcon: "figure.walk", text: "Sign Out", color: Color.MyTheme.maroonColor)
                        })
                        .alert(isPresented: $showSignOutError, content: {
                            return Alert(title: Text("Error Signing Out"))
                        })
                    })
                    .padding()
                    
                    // MARK: SECTION 3: APPLICATION
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                        
                        Button(action: {
                            openCustomURL(urlString: "https://www.google.com")
                        }, label: {
                            SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.maroonColor)
                        })
                        
                        Button(action: {
                            openCustomURL(urlString: "https://www.yahoo.com")
                        }, label: {
                            SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.maroonColor)
                        })
                        
                        Button(action: {
                            openCustomURL(urlString: "https://www.bing.com")
                        }, label: {
                            SettingsRowView(leftIcon: "globe", text: "Zeta's Website", color: Color.MyTheme.maroonColor)
                        })
                    })
                    .padding()
                    
                    // MARK: SECTION 4: SIGN OFF
                    GroupBox {
                        Text("Zeta was made with love. \n All rights reserved \n Company Inc. \n Copyright 2021 ????")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                    }
                    .padding()
                    .padding(.bottom, 80)
                }
                .navigationBarTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                                        Button(action: {
                                            presentationMode.wrappedValue.dismiss()
                                        }, label: {
                                            Image(systemName: "xmark")
                                                .font(.title)
                                        })
                                        .accentColor(Color.MyTheme.maroonColor)
                )
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack(alignment: .center) {
                            
                            Text("Settings")
                                .foregroundColor(Color.MyTheme.goldColor)
                                .fontWeight(.bold)
                                .font(.custom("SignPainter", size: 30))
                        }
                    }
            }
            }
        }
        .accentColor(Color.MyTheme.maroonColor)
    }
    
    // MARK: FUNCTIONS
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func signOut() {
        AuthService.instance.logOutUser { (success) in
            if success {
                print("Successfully logged out")
                
                // Dismiss settings view
                self.presentationMode.wrappedValue.dismiss()
                
                
                
            } else {
                print("Error logging out")
                self.showSignOutError.toggle()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @State static var testString = ""
    @State static var image: UIImage = UIImage(named: "soccer1")!
    
    static var previews: some View {
        SettingsView(userDisplayName: $testString, userBio: $testString, userProfilePicture: $image)
    }
}
