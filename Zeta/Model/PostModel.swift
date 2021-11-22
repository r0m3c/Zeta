//
//  PostModel.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/21/21.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    var id = UUID()
    var postID: String // id for post in database
    var userID: String // id for user in database
    var username: String // username of user in database
    var caption: String?
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
