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
        ZStack {
            Color.MyTheme.maroonColor
                .edgesIgnoringSafeArea(.all)
            
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
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(alignment: .center) {
                        Text(title)
                            .foregroundColor(Color.MyTheme.goldColor)
                            .font(.custom("SignPainter", size: 30))
                    }
                }
        }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView(posts: PostArrayObject(), title: "Feed Test")
        }
    }
}
