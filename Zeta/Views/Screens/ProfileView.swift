//
//  ProfileView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/23/21.
//

import SwiftUI

struct ProfileView: View {
    var posts = PostArrayObject()
    @State var profileDisplayName: String
    var profileUserID: String
    var isMyProfile: Bool
    
    var body: some View {
        ZStack {
            Color.MyTheme.maroonColor
                .edgesIgnoringSafeArea(.top)
            
            ScrollView {
                ProfileHeaderView(profileDisplayName: $profileDisplayName)
                
                Divider()
                
                ImageGridView(posts: posts)
            }
            .navigationBarTitle("HI")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        
                                    }, label: {
                                        Image(systemName: "line.horizontal.3")
                                            .accentColor(Color.MyTheme.goldColor)
                                            .opacity(isMyProfile ? 1.0 : 0.0)
                                    })
            )
            .background(Color.MyTheme.maroonColor)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack(alignment: .center) {
                        Text("Profile")
                            .foregroundColor(Color.MyTheme.goldColor)
                            .font(.custom("SignPainter", size: 30))
                    }
                }
        }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profileDisplayName: "Joe", profileUserID: "", isMyProfile: true)
        }
    }
}
