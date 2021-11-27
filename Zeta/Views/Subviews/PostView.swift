//
//  PostView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/21/21.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    @State var isPresented: Bool = false
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    @State var showActionSheet: Bool = false
    @State var postImage: UIImage = UIImage(named: "soccer1")!
    
    var showHeaderAndFooter: Bool
    
    @State var actionSheetType: PostActionSheetOption = .general
    
    enum PostActionSheetOption {
        case general
        case reporting
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // MARK: HEADER
            if showHeaderAndFooter {
                HStack {
                    
                    NavigationLink(
                        destination: ProfileView(profileDisplayName: post.username, profileUserID: post.userID, isMyProfile: false),
                        label: {
                            Image("soccer1")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30, alignment: .center)
                                .cornerRadius(15)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.MyTheme.goldColor, lineWidth: 2))
                            
                            Text(post.username)
                                .font(.callout)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        })
                    
                    Spacer()
                    
                    Button(action: {
                        showActionSheet.toggle()
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                            .foregroundColor(.white)
                    })
                    .actionSheet(isPresented: $showActionSheet, content: {
                        getActionSheet()
                    })
                }
                .padding(.all, 6)
            }
            
            
            
            // MARK: IMAGE
            
            ZStack {
                Image(uiImage: postImage)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Rectangle())
                    .overlay(Rectangle().stroke(Color.MyTheme.goldColor, lineWidth: 6))
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }
            
            // MARK: FOOTER
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        if post.likedByUser {
                            //Unlike post
                            unlikePost()
                        } else {
                            // Like post
                            likePost()
                        }
                    }, label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                            .font(.title3)
                            .foregroundColor(.white)
                    })
                    .accentColor(post.likedByUser ? .red : .white)
                    
                    // MARK: COMMENT ICON
                    Button(action: {
                        self.isPresented.toggle()
                    }, label: {
                        Image(systemName: "bubble.middle.bottom")
                            .font(.title3)
                            .foregroundColor(.white)
                            .fullScreenCover(isPresented: $isPresented, content: {
                                CommentsView()
                            })
                    })

                    Button(action: {
                        sharePosts()
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                            .foregroundColor(.white)
                    })
                    
                    Spacer()
                }
                .padding(.all, 6)
                
                if let caption = post.caption {
                    HStack {
                        Text(caption)
                            .foregroundColor(.white)
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.all, 6)
                }
            }
        }
    }
    
    // MARK: FUNCTIONS
    
    func likePost() {
        // Update the local data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount+1, likedByUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateLike = false
        }
    }
    
    func unlikePost() {
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, username: post.username, caption: post.caption, dateCreated: post.dateCreated, likeCount: post.likeCount-1, likedByUser: false)
        self.post = updatedPost
    }
    
    func getActionSheet() ->ActionSheet {
        switch self.actionSheetType {
        case .general:
            return ActionSheet(title: Text("What would you like to do?"), message: nil, buttons: [
            
                .destructive(Text("Report"), action: {
                    self.actionSheetType = .reporting
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showActionSheet.toggle()
                    }
                }),
                .default(Text("Learn more..."), action: {
                    print("Learn more pressed")
                }),
                .cancel()
                
            ])
        case .reporting:
            return ActionSheet(title: Text("Why are you reporting this post?"), message: nil, buttons: [
            
                .destructive(Text("This is innapropriate"), action: {
                    reportPost(reason: "This is innapropriate")
                }),
                .destructive(Text("This is spam"), action: {
                    reportPost(reason: "This is spam")
                }),
                .destructive(Text("It made me uncomfortable"), action: {
                    reportPost(reason: "It made me uncomfortable")
                }),
                .cancel({
                    self.actionSheetType = .general
                })
            ])
        }
    }
    
    func reportPost(reason: String) {
        print("Report post now")
    }
    
    func sharePosts() {
        let message = "Checkout this post on Zeta"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [
            message, image, link
        ], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityViewController, animated: true, completion: nil)
    }
}

struct PostView_Previews: PreviewProvider {
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Lionel Messi", caption: "Test Caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        PostView(post: post, addHeartAnimationToView: true, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
