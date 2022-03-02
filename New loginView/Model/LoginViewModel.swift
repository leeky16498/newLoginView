//
//  LoginModel.swift
//  New loginView
//
//  Created by Kyungyun Lee on 18/02/2022.
//

import Foundation
import Firebase
import SwiftUI
import Combine


class LoginViewModel : ObservableObject {
    
    @Published var idString : String = ""
    @Published var passwordString : String = ""

    @Published var isLoginPrepared : Bool = false
    @Published var isIDPrepared : Bool = false
    @Published var isPWPrepared : Bool = false
    
    lazy var idStringSubject : AnyPublisher<String, Never> = $idString
        .eraseToAnyPublisher() // 기본적으로 값들은 정의하는 단계에서 가져다 바로 쓸 수 없다. 그래서 통상 생성자 단계에서 쓰기도 한다.
    
    var idStatusSubject = PassthroughSubject<Bool, Never>()
        var pwStatusSubject = PassthroughSubject<Bool, Never>()
        
        var cancelables = Set<AnyCancellable>()
        
        init() {
            
            $idString
                .map { [unowned self] id in
                    checkIDString(id: id)
                }
                .assign(to: &$isIDPrepared)

            $isIDPrepared
                .sink { [unowned self] result in
                    idStatusSubject.send(result)
                }
                .store(in: &cancelables)
            
            $passwordString
                .map { [unowned self] id in
                    checkPWString(pw: id)
                }
                .assign(to: &$isPWPrepared)

            $isPWPrepared
                .sink { [unowned self] result in
                    pwStatusSubject.send(result)
                }
                .store(in: &cancelables)
        }
    
    
    
    let auth = Auth.auth()
    
    @Published var singedIn : SignIn = .yet
    
    var isSignedIn : Bool {
        return auth.currentUser == nil
    }
    
    func checkIDString(id : String) -> Bool {
        
        return id.count > 8 && id.contains("@")
    }
    
    func checkPWString(pw : String) -> Bool {
        return  pw.count > 8
    }
    
    func loginAccount(email : String, passWord : String) {
        
        auth.signIn(withEmail: idString, password: passwordString) { [weak self] result, error in
        
            if result != nil {
                self?.singedIn = .good
            }
            if error != nil {
                self?.singedIn = .fail
            }
        }
    }
}

enum IdStatus {
    case yet
    case bad
    case good
}

enum PwStatus {
    case yet
    case bad
    case good
}

enum SignIn {
    case good
    case fail
    case yet
}
