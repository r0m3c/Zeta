//
//  UploadView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/23/21.
//

import SwiftUI
import UIKit

struct UploadView: View {
    
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage = UIImage(named: "logo1")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var showPostImageView: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.camera
                    showImagePicker.toggle()
                }, label: {
                    LottieView(animationName: "loading")
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.goldColor)
                
                Button(action: {
                    sourceType = UIImagePickerController.SourceType.photoLibrary
                    showImagePicker.toggle()
                }, label: {
                    LottieView(animationName: "import")
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.MyTheme.maroonColor)
            }
            .sheet(isPresented: $showImagePicker, onDismiss: segueToPostImageView, content: {
                ImagePicker(imageSelected: $imageSelected, sourceType: $sourceType)
            })
            
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(radius: 20)
                .fullScreenCover(isPresented: $showPostImageView, content: {
                    PostImageView(imageSelected: $imageSelected)
                })
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    // MARK: FUNCTIONS
    
    func segueToPostImageView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showPostImageView.toggle()
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
