//
//  ProfileView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/23/21.
//

import SwiftUI

struct ProfileView: View {
    var posts: PostArrayObject
    @State var profileDisplayName: String
    var profileUserID: String
    @State var profileImage: UIImage = UIImage(named: "logo.loading")!
    
    var isMyProfile: Bool
    @State var showSettings: Bool = false
    
    var body: some View {
        ZStack {
            Color.MyTheme.maroonColor
                .edgesIgnoringSafeArea(.top)
            
            ScrollView {
                ProfileHeaderView(profileDisplayName: $profileDisplayName, profileImage: $profileImage, postArray: posts)
                
                Divider()
                
                ImageGridView(posts: posts)
            }
            .navigationBarTitle("HI")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showSettings.toggle()
                                    }, label: {
                                        Image(systemName: "gearshape.fill")
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
            .onAppear(perform: {
                getProfileImage()
            })
            .sheet(isPresented: $showSettings, content: {
                SettingsView()
            })
        }
    }
    
    // MARK: FUNCTIONS
    func getProfileImage() {
        ImageManager.instance.downloadProfileImage(userID: profileUserID) { (returnedImage) in
            if let image = returnedImage {
                self.profileImage = image
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(posts: PostArrayObject(userID: ""), profileDisplayName: "Joe", profileUserID: "", isMyProfile: true)
        }
    }
}
