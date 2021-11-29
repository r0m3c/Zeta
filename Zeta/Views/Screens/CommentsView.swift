//
//  CommentsView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/22/21.
//

import SwiftUI

struct CommentsView: View {
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    @Environment(\.presentationMode) var presentationMode
    
    @State var profilePicture: UIImage = UIImage(named: "logo.loading")!
    
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?
    @AppStorage(CurrentUserDefaults.displayName) var currentUserDisplayName: String?
    
    var post: PostModel
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    })
                    .padding(.leading, 6)
                    Spacer()
                    Spacer()
                    
                    Text("Comments")
                        .accentColor(.black)
                        .padding(.trailing, 15)
                    
                    Spacer()
                    Spacer()
                }
            }
            
            // Messages scrollview
            ScrollView {
                LazyVStack {
                    ForEach(commentArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            // Bottom hstack
            HStack {
                Image(uiImage: profilePicture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment here", text: $submissionText)
                
                Button(action: {
                    if textIsAppropriate() {
                        addComment()
                    }
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(Color.MyTheme.maroonColor)
            }
            .padding(.all, 6)
        }
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            getComments()
            getProfilePicture()
        }
    }
    
    // MARK: FUNCTIONS
    func getProfilePicture() {
        guard let userID = currentUserID else { return }
        
        ImageManager.instance.downloadProfileImage(userID: userID) { (returnedImage) in
            if let image = returnedImage {
                self.profilePicture = image
            }
        }
    }
    
    func getComments() {
        guard self.commentArray.isEmpty else {return}
        
        print("Get comments from Database")
        if let caption = post.caption, caption.count > 1 {
            let captionComment = CommentModel(commentID: "", userID: post.userID, username: post.username, content: caption, dateCreated: post.dateCreated)
            self.commentArray.append(captionComment)
        }
        
        DataService.instance.downloadComments(postID: post.postID) { (returnedComments) in
            self.commentArray.append(contentsOf: returnedComments)
        }
    }
    
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
    
    func addComment() {
        guard let userID = currentUserID, let displayName = currentUserDisplayName else {return}
        
        DataService.instance.uploadComment(postID: post.postID, content: submissionText, displayName: displayName, userID: userID) { (success, returnedCommentID) in
            if success, let commentID = returnedCommentID {
                let newComment = CommentModel(commentID: commentID, userID: userID, username: displayName, content: submissionText, dateCreated: Date())
                self.commentArray.append(newComment)
                
                self.submissionText = ""
                
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static let post = PostModel(postID: "assf", userID: "asdf", username: "asf", caption: "afsafafaffa", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        CommentsView(post: post)
    }
}
