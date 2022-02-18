//
//  New_loginViewApp.swift
//  New loginView
//
//  Created by Kyungyun Lee on 17/02/2022.
//

import SwiftUI
import Firebase

@main
struct New_loginViewApp: App {
    
    @StateObject var loginModel : LoginModel = LoginModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginModel)
        }
    }
}
