//
//  MessageView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/22/21.
//

import SwiftUI

struct MessageView: View {
    @State var comment: CommentModel
    @State var profilePicture: UIImage = UIImage(named: "logo.loading")!
    
    var body: some View {
        HStack {
            
            // MARK: PROFILE IMAGE
            NavigationLink(
                destination: LazyView(content: {
                    ProfileView(posts: PostArrayObject(userID: comment.userID), profileDisplayName: comment.username, profileUserID: comment.userID, isMyProfile: false)
                })) {
                
                Image(uiImage: profilePicture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            }
               
            
            
            VStack(alignment: .leading, spacing: 4) {
                
                // MARK: USERNAME
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: CONTENT
                Text(comment.content)
                    .padding(.all, 10)
                    .foregroundColor(.black)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.leading)
        .onAppear {
            getProfileImage()
        }
    }
    
    // MARK: FUNCTIONS
    func getProfileImage() {
        ImageManager.instance.downloadProfileImage(userID: comment.userID) { (returnedImage) in
            if let image = returnedImage {
                self.profilePicture = image
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Lionel Messi", content: "This is very cool", dateCreated: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
