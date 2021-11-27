//
//  AuthService.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/27/21.
//

// Used to authenticate users in Firebase
// Used to handle user accounts in Firebase
import Foundation
import FirebaseAuth
import FirebaseFirestore // Database

let DB_BASE = Firestore.firestore()

class AuthService {
    // MARK: PROFERTIES
    static let instance = AuthService()
    
    private var REF_USERS = DB_BASE.collection("users")
    
    // MARK: AUTH USER FUNCTIONS
    func logInUserToFirebase(credential: AuthCredential, handler: @escaping (_ providerID: String?, _ isError: Bool) -> ()) {
        Auth.auth().signIn(with: credential) { (result, error) in
            // Check for errors
            if error != nil {
                print("Error logging into Firebase")
                handler(nil, true)
                return
            }
            
            // Check for provider ID
            guard let providerID = result?.user.uid else {
                print("Error getting provider ID")
                handler(nil, true)
                return
            }
            
            // Success connecting to Firebase
            handler(providerID, false)
        }
        
    }
    
    func createNewUserInDatabase(name: String, email: String, providerID: String, provider: String, profileImage: UIImage, handler: @escaping (_ userID: String?) -> ()) {
        // Set up a user document with the user collection
        let document = REF_USERS.document()
        let userID = document.documentID
        
        // Upload profile image to Storage
        ImageManager.instance.uploadProfileImage(userID: userID, image: profileImage)
        
        // Upload profile data to Firestore
        let userData: [String: Any] = [
            DatabaseUserField.displayName: name,
            DatabaseUserField.email: email,
            DatabaseUserField.providerID: providerID,
            DatabaseUserField.provider: provider,
            DatabaseUserField.userID: userID,
            DatabaseUserField.bio: "",
            DatabaseUserField.dateCreated: FieldValue.serverTimestamp()
        ]
        
        document.setData(userData) { (error) in
            if let error = error {
                // Error
                print("Error uploading data to user document. \(error)")
                handler(nil)
            } else {
                // Success
                handler(userID)
            }
        }
        
    }
}
