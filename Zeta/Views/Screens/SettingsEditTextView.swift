//
//  SettingsEditTextView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/26/21.
//

import SwiftUI

struct SettingsEditTextView: View {
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .foregroundColor(Color.MyTheme.maroonColor)
            
            VStack {
                HStack {
                    Text(description)
                        .foregroundColor(Color.MyTheme.maroonColor)
                    
                    Spacer()
                }
                
                TextField(placeholder, text: $submissionText)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.goldColor)
                    .cornerRadius(12)
                    .font(.headline)
                    .autocapitalization(.sentences)
                    .foregroundColor(Color.MyTheme.maroonColor)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.MyTheme.maroonColor)
                        .cornerRadius(12)
                })
                .accentColor(Color.MyTheme.goldColor)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
//            .navigationBarTitle(title)
            .background(Color.black)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(alignment: .center) {
                        
                        Text(title)
                            .foregroundColor(Color.MyTheme.maroonColor)
                            .fontWeight(.bold)
                            .font(.custom("SignPainter", size: 30))
                            .accentColor(Color.MyTheme.maroonColor)
                    }
                }
            }
        }
        .accentColor(Color.MyTheme.maroonColor)
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditTextView(title: "Test title", description: "This is a description", placeholder: "Test placeholder")
        }
    }
}
