//
//  MessageView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/22/21.
//

import SwiftUI

struct MessageView: View {
    @State var comment: CommentModel
    
    var body: some View {
        HStack {
            
            // MARK: PROFILE IMAGE
            Image("soccer1")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            
            VStack(alignment: .leading, spacing: 4) {
                
                // MARK: USERNAME
                Text(comment.username)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: CONTENT
                Text(comment.content)
                    .padding(.all, 10)
                    .foregroundColor(.black)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            
            Spacer(minLength: 0)
        }
        .padding(.leading)
    }
}

struct MessageView_Previews: PreviewProvider {
    static var comment: CommentModel = CommentModel(commentID: "", userID: "", username: "Lionel Messi", content: "This is very cool", dateCreated: Date())
    
    static var previews: some View {
        MessageView(comment: comment)
            .previewLayout(.sizeThatFits)
    }
}
