//
//  ProfileHeaderView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/23/21.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Binding var profileDisplayName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            // MARK: PROFILE PICTURE
            Image("soccer1")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .cornerRadius(60)
                .clipShape(Rectangle())
                .overlay(Circle().stroke(Color.MyTheme.goldColor, lineWidth: 5))
            
            // MARK: USERNAME
            Text(profileDisplayName)
                .font(.largeTitle)
                .foregroundColor(.white)
            
            // MARK: BIO
            Text("This is the are where the user can add a bio to their profile")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
            
            // MARK: POSTS
            HStack(alignment: .center, spacing: 20) {
                VStack(alignment: .center, spacing: 5) {
                    Text("5")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 20, height: 2)
                    
                    Text("Posts")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                
                // MARK: Likes
                HStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .center, spacing: 5) {
                        Text("20")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Capsule()
                            .fill(Color.black)
                            .frame(width: 20, height: 2)
                        
                        Text("Likes")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                    }
                }

            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    @State static var name: String = "Joe"
    static var previews: some View {
        ProfileHeaderView(profileDisplayName: $name)
            .previewLayout(.sizeThatFits)
            .background(Color.red)
    }
}
