//
//  CommentsView.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/22/21.
//

import SwiftUI

struct CommentsView: View {
    @State var submissionText: String = ""
    @State var commentArray = [CommentModel]()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    })
                    .padding(.leading, 6)
                    Spacer()
                    Spacer()
                    
                    Text("Comments")
                        .accentColor(.black)
                        .padding(.trailing, 15)
                    
                    Spacer()
                    Spacer()
                }
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(commentArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("soccer1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment here", text: $submissionText)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(Color.MyTheme.maroonColor)
            }
            .padding(.all, 6)
        }
        .navigationBarTitle("Comments")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            getComments()
        }
    }
    
    // MARK: FUNCTIONS
    func getComments() {
        print("Get comments from Database")
        
        let comment1 = CommentModel(commentID: "", userID: "", username: "Lionel Messi", content: "This is the first Comment", dateCreated: Date())
        let comment2 = CommentModel(commentID: "", userID: "", username: "Ronaldinho", content: "This is the second Comment", dateCreated: Date())
        let comment3 = CommentModel(commentID: "", userID: "", username: "Kaka", content: "This is the third Comment", dateCreated: Date())
        let comment4 = CommentModel(commentID: "", userID: "", username: "Cristiano Ronaldo", content: "This is the fourth Comment", dateCreated: Date())
        
        self.commentArray.append(comment1)
        self.commentArray.append(comment2)
        self.commentArray.append(comment3)
        self.commentArray.append(comment4)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}
