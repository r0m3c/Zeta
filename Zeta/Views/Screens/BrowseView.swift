//
//  BrowseView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/22/21.
//

import SwiftUI

struct BrowseView: View {
    var posts: PostArrayObject
    
    var body: some View {
        ZStack {
            Color.MyTheme.maroonColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    CarouselView()
                    
                    ImageGridView(posts: posts)
                }
                .navigationBarTitle("Browse", displayMode: .inline)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading:
                    Text("Zeta")
                        .font(.custom("SignPainter", size: 30))
                        .foregroundColor(Color.MyTheme.goldColor)
                )
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack(alignment: .center) {
                            Image(systemName: "magnifyingglass")
                            
                            Text("Browse")
                                .foregroundColor(Color.MyTheme.goldColor)
//                                .fontWeight(.bold)
                                .font(.custom("SignPainter", size: 30))
                        }
                    }
                }
            }
        }
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BrowseView(posts: PostArrayObject(shuffled: true))
        }
    }
}
