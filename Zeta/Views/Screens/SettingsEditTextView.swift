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
    
    @State var settingsEditTextOption: SettingsEditTextOption
    
    @Binding var profileText: String
    
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?
    
    @State var showSuccessAlert: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
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
                    if textIsAppropriate() {
                        saveText()
                    }
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
            .alert(isPresented: $showSuccessAlert, content: {
                return Alert(title: Text("Saved!"), message: nil, dismissButton: .default(Text("OK"), action: {
                    self.presentationMode.wrappedValue.dismiss()
                }))
            })
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
    
    // MARK: FUNCTIONS
    func textIsAppropriate() -> Bool {
        // Check if the text has curses,
        // Text is long enough
        // Check if the text is blank
        
        let badWordArray: [String] = [
            "shit", "ass"
        ]
        
        let words = submissionText.components(separatedBy: " ")
        
        // Checking for bad words
        for word in words {
            if badWordArray.contains(word) {
                return false
            }
        }
        
        // Checking for minimum character count
        if submissionText.count < 3 {
            return false
        }
        
        return true
    }
    
    func saveText() {
        guard let userID = currentUserID else {return}
        
        switch settingsEditTextOption {
        case .displayName:
            // Update UI on the Profile
            self.profileText = submissionText
        
            // Update the UserDefaults
            UserDefaults.standard.setValue(submissionText, forKey: CurrentUserDefaults.displayName)
        
            // Update on all of the users Posts
            DataService.instance.updateDisplaynameOnPosts(userID: userID, displayName: submissionText)
        
            // Update on the users profile on the Database
            AuthService.instance.updateUserDisplayName(userID: userID, displayName: submissionText) { (success) in
                self.showSuccessAlert.toggle()
            }
        
        case .bio:
            // Update UI on the Profile
            self.profileText = submissionText
            
            // Update the UserDefaults
            UserDefaults.standard.set(submissionText, forKey: CurrentUserDefaults.bio)
            
            // Update on the users profile on the Database
            AuthService.instance.updateUserBio(userID: userID, bio: submissionText) { (success) in
                if success {
                    self.showSuccessAlert.toggle()
                }
            }
        
        }
    }

}

struct SettingsEditTextView_Previews: PreviewProvider {
    
    @State static var text: String = ""
    
    static var previews: some View {
        NavigationView {
            SettingsEditTextView(title: "Test title", description: "This is a description", placeholder: "Test placeholder", settingsEditTextOption: .displayName, profileText: $text)
        }
    }
}
