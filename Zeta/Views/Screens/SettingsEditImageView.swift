//
//  SettingsEditImageView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/26/21.
//

import SwiftUI

struct SettingsEditImageView: View {
    @State var title: String
    @State var description: String
    @State var selectedImage: UIImage // Image shown on this screen
    @State var showImagePicker: Bool = false
    @State var sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
    
    @Binding var profileImage: UIImage // Image shown on the profile
    
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
                
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                    .cornerRadius(12)
                
                Button(action: {
                    showImagePicker.toggle()
                }, label: {
                    Text("Import".uppercased())
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .frame(height: 60)
                        .frame(maxWidth: .infinity)
                        .background(Color.MyTheme.goldColor)
                        .cornerRadius(12)
                })
                .accentColor(Color.MyTheme.maroonColor)
                .sheet(isPresented: $showImagePicker, content: {
                    ImagePicker(imageSelected: $selectedImage, sourceType: $sourceType)
                })
                
                Button(action: {
                    saveImage()
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
                return Alert(title: Text("Success!"), message: nil, dismissButton: .default(Text("OK"), action: {
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
                    }
                }
            }
        }
        .accentColor(Color.MyTheme.maroonColor)
    }
    
    // MARK: FUNCTIONS
    func saveImage() {
        guard let userID = currentUserID else {return}
        
        // Update the UI of the profile
        self.profileImage = selectedImage
        
        // Update profile image in database
        ImageManager.instance.uploadProfileImage(userID: userID, image: selectedImage)
        
        self.showSuccessAlert.toggle()
        
    }
}

struct SettingsEditImageView_Previews: PreviewProvider {
    @State static var image: UIImage = UIImage(named: "soccer1")!
    
    static var previews: some View {
        NavigationView {
            SettingsEditImageView(title: "Title", description: "Description", selectedImage: UIImage(named: "soccer1")!, profileImage: $image)
        }
    }
}
