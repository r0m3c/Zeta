//
//  ZetaApp.swift
//  Zeta
//
//  Created by Leandro Gamarra on 11/21/21.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct ZetaApp: App {
    
    init() {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID // For Google Sign In
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    GIDSignIn.sharedInstance().handle(url) // For Google Sign In
                })
        }
    }
}
