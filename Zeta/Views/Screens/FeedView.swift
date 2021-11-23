//
//  FeedView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/21/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var posts: PostArrayObject
    var title: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(posts.dataArray, id: \.self) { post in
                    PostView(post: post, showHeaderAndFooter: true)
                    
                }
            }
        }
        .navigationBarTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.MyTheme.maroonColor)
        .navigationBarItems(trailing:
            Text("Zeta")
                .font(.custom("SignPainter", size: 30))
                .foregroundColor(Color.MyTheme.goldColor)
            )
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView(posts: PostArrayObject(), title: "Feed Test")
        }
    }
}
