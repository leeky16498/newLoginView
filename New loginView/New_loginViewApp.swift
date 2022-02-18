//
//  New_loginViewApp.swift
//  New loginView
//
//  Created by Kyungyun Lee on 17/02/2022.
//

import SwiftUI
import Firebase // firebase 의 설정에 대해 간단히 알아보자.
//1. 파이어베이스에 프로젝트 등록, 2. 파이어베이스 패키지를 앱에 깔아준다(xcode - file - add packages)간 다음 빈칸에 firebase ios치면 바로 하나뜬다. 거기에서 추가해주면 설치가 시작됨.
//물론 코코아팟을 통해서도 사용은 가능하다. 그 후, 패키지에서 필요한 옵션을 선택하라고 하면 내가 필요한 옵션을 선택한다. 나같은 경우 Auth계열과, fireStore 등 자료와 관련된 것들을 선택했다.
//그리고 앱에 임폴트를 해주고, 앱이 실행되면서 작동이 가능하도록 아래와 같이 선언한다.

@main
struct New_loginViewApp: App {
    
    @StateObject var loginModel : LoginModel = LoginModel()
    
    init() {
        FirebaseApp.configure() // 다음과 같이 파이어베이스 가동을 선언해준다.
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(loginModel)
        }
    }
}
