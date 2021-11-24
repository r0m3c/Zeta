//
//  SettingsView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/24/21.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
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
                    
                    SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.maroonColor)
                    
                    SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.maroonColor)
                    
                    SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.maroonColor)
                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Sign Out", color: Color.MyTheme.maroonColor)
                })
                .padding()
                
                // MARK: SECTION 3: APPLICATION
                GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"), content: {
                    
                    SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.maroonColor)
                    
                    SettingsRowView(leftIcon: "folder.fill", text: "Terms & Conditions", color: Color.MyTheme.maroonColor)
                    
                    SettingsRowView(leftIcon: "globe", text: "Zeta's Website", color: Color.MyTheme.maroonColor)
                })
                .padding()
                
                // MARK: SECTION 4: SIGN OFF
                GroupBox {
                    Text("Zeta was made with love. \n All rights reserved \n Company Inc. \n Copyright 2021 😍")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .padding(.bottom, 80)
            }
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                                    Button(action: {
                                        presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "xmark")
                                            .font(.title)
                                    })
                                    .accentColor(Color.MyTheme.maroonColor)
            )
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
