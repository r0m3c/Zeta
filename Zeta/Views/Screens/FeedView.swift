//
//  FeedView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/21/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        
        ZStack {
            Color.MyTheme.maroonColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                ZStack(alignment: .leading) {
                    Color.MyTheme.maroonColor
                        .frame(height: 50)
                                    
                    Text("Zeta")
                        .foregroundColor(Color.MyTheme.goldColor)
                        .font(.custom("SignPainter", size: 50))
                        .padding(.leading, 13)
                        
                }
                    
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(posts.dataArray, id: \.self) { post in
                            PostView(post: post)
                        }
                    }
                }
            }
            .background(Color.MyTheme.maroonColor)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
        FeedView(posts: PostArrayObject())
//        }
    }
}
