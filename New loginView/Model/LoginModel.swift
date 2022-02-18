//
//  LoginModel.swift
//  New loginView
//
//  Created by Kyungyun Lee on 18/02/2022.
//

import Foundation
import Firebase // firebase 임폴트해서 사용 준비
import SwiftUI

class LoginModel : ObservableObject {
    
    let auth = Auth.auth() // Auth 기능 상수 선언
    
    @Published var singedIn : SignIn = .yet
    
    var isSignedIn : Bool {
        return auth.currentUser == nil // 유저의 접속여부를 리턴해 줄 코드
    }
    
    func loginAccount(email : String, passWord : String) {
        
        auth.signIn(withEmail: email, password: passWord) { [weak self] result, error in // weak self로 선언한 이유는 메모리 누수를 방지하기 위해서이다.
        
            if result != nil {
                
                DispatchQueue.main.async { 
                    self?.singedIn = .good // 메인 스레드 작업 여건 보장을 위해서 디스패치큐를 걸어서 작업을 멀티 쓰레드로 옮겨준다.
                }
            }
            if error != nil {
                DispatchQueue.main.async { 
                    self?.singedIn = .fail // 메인 스레드 작업 여건 보장을 위해서 디스패치큐를 걸어서 작업을 멀티 쓰레드로 옮겨준다.
                }
            }
        }
    }
}

enum SignIn {
    case good
    case fail
    case yet
}
