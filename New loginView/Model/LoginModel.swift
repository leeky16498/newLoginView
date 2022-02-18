//
//  LoginModel.swift
//  New loginView
//
//  Created by Kyungyun Lee on 18/02/2022.
//

import Foundation
import Firebase
import SwiftUI

class LoginModel : ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var singedIn : SignIn = .yet
    
    var isSignedIn : Bool {
        return auth.currentUser == nil
    }
    
    func loginAccount(email : String, passWord : String) {
        
        auth.signIn(withEmail: email, password: passWord) { [weak self] result, error in
        
            if result != nil {
                self?.singedIn = .good
            }
            if error != nil {
                self?.singedIn = .fail
            }
        }
    }
}

enum SignIn {
    case good
    case fail
    case yet
}
