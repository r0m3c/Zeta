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
    
    var showHeaderAndFooter: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            // MARK: HEADER
            if showHeaderAndFooter {
                HStack {
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
                    
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .font(.headline)
                        .foregroundColor(.white)
                }
                .padding(.all, 6)
            }
            
            
            
            // MARK: IMAGE
            Image("soccer1")
                .resizable()
                .scaledToFit()
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.MyTheme.goldColor, lineWidth: 6))
            
            // MARK: FOOTER
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    Image(systemName: "heart")
                        .font(.title3)
                        .foregroundColor(.white)
                    
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

                    
                    Image(systemName: "paperplane")
                        .font(.title3)
                        .foregroundColor(.white)
                    
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
}

struct PostView_Previews: PreviewProvider {
    static var post: PostModel = PostModel(postID: "", userID: "", username: "Lionel Messi", caption: "Test Caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
    
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
