//
//  ContentView.swift
//  Zeta
// 
//  Created by Leandro Gamarra on 11/21/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?
    @AppStorage(CurrentUserDefaults.displayName) var currentUserDisplayName: String?
    
    let feedPosts = PostArrayObject(shuffled: false)
    let browsePosts = PostArrayObject(shuffled: true)
    
    var body: some View {
        TabView {
            NavigationView {
                FeedView(posts: feedPosts, title: "Home")
            }
                .tabItem {
                    Image(systemName: "book.fill")
                    Text("Feed")
                }
            
            NavigationView {
                BrowseView(posts: browsePosts)
            }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            
            UploadView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upload")
                }
            
            ZStack {
                if let userID = currentUserID, let displayName = currentUserDisplayName {
                    NavigationView {
                        ProfileView(posts: PostArrayObject(userID: userID), profileDisplayName: displayName, profileUserID: userID, isMyProfile: true)
                    }
                } else {
                    SignUpView()
                }
            }
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
