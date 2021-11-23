//
//  PostArrayObject.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/21/21.
//

import Foundation

class PostArrayObject: ObservableObject {
    @Published var dataArray = [PostModel]()
    
    init() {
        print("Fetch from Database here")
        
        let post1 = PostModel(postID: "", userID: "", username: "Lionel Messi", caption: "This is a caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        let post2 = PostModel(postID: "", userID: "", username: "Ronaldinho", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        let post3 = PostModel(postID: "", userID: "", username: "Kaka", caption: "This is a really really long caption", dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        let post4 = PostModel(postID: "", userID: "", username: "Cristiano Ronaldo", caption: nil, dateCreated: Date(), likeCount: 0, likedByUser: false)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
    }
    
    /// USED FOR SINGLE POST SELECTION
    init(post: PostModel) {
        self.dataArray.append(post)
    }
}
