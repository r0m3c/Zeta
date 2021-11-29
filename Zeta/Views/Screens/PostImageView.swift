//
//  PostImageView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/23/21.
//

import SwiftUI

struct PostImageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var captionText: String = ""
    @Binding var imageSelected: UIImage
    
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?
    @AppStorage(CurrentUserDefaults.displayName) var currentUserDisplayname: String?
    
    //Alert
    @State var showAlert: Bool = false
    @State var postUploadedSuccessfully: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .padding()
                })
                .accentColor(Color.MyTheme.maroonColor)
                
                Spacer()
                
                Text("Add Picture and Caption")
                    .foregroundColor(Color.MyTheme.maroonColor)
                    .fontWeight(.bold)
                    .font(.custom("SignPainter", size: 30))
                
                Spacer()
                Spacer()
            }
            
            VStack {
                
                Spacer()
                Image(uiImage: imageSelected)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
//                    .cornerRadius(12)
                    .clipped()
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.MyTheme.goldColor, lineWidth: 12))
                    .cornerRadius(12)
                
                Spacer()
                                
                TextField("Add your caption here...", text: $captionText)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.goldColor)
                    .cornerRadius(12)
                    .font(.headline)
                    .padding(.horizontal)
                    .autocapitalization(.sentences)
                    .foregroundColor(Color.MyTheme.maroonColor)
                                
                Button(action: {
                    postPicture()
                }, label: {
                    Text("Post".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.MyTheme.maroonColor)
                        .cornerRadius(12)
                        .padding(.horizontal)
                })
                .accentColor(Color.MyTheme.goldColor)
                
                Spacer()
                Spacer()
                Spacer()
            }
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
    }
    
    // MARK: FUNCTIONS
    
    func postPicture() {
        print("Post picture to database here")
        
        guard let userID = currentUserID, let displayName = currentUserDisplayname else {
            print("Error getting userID or displayName while posting image")
            return
        }
        
        DataService.instance.uploadPost(image: imageSelected, caption: captionText, displayName: displayName, userID: userID) { (success) in
            self.postUploadedSuccessfully = success
            self.showAlert.toggle()
        }
    }
    
    func getAlert() -> Alert {
        if postUploadedSuccessfully {
            return Alert(title: Text("Successfully uploaded post!"), message: nil, dismissButton: .destructive(Text("OK"), action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
        } else {
            return Alert(title: Text("Error uploading post!"))
        }
    }
}

struct PostImageView_Previews: PreviewProvider {
    @State static var image = UIImage(named: "soccer1")!
    
    static var previews: some View {
        PostImageView(imageSelected: $image)
    }
}
