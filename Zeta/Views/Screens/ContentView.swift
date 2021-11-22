//
//  ContentView.swift
//  Zeta
// 
//  Created by Leandro Gamarra on 11/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FeedView(posts: PostArrayObject())
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Feed")
                }
            
            Text("Screen2")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            
            Text("Screen3")
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upload")
                }
            
            Text("Screen4")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color.MyTheme.maroonColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
