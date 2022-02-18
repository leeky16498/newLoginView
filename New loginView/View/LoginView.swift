//
//  LoginView.swift
//  New loginView
//
//  Created by Kyungyun Lee on 17/02/2022.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var loginModel : LoginModel
    
    @State var idString : String = ""
    @State var passwordString : String = ""
    @State var isLoginPrepared : Bool = false
    
    @State var isIDPrepared : Bool = false
    @State var isPWPrepared : Bool = false
    @State var idStatus : IdStatus = .yet
    @State var pwStatus : PwStatus = .yet
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea(.all)
            if loginModel.singedIn == .good {
                LoginCheckView()
            } else if loginModel.singedIn == .fail{
                Text("failed")
            } else {
                VStack{
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss() // 뷰의 디스미스를 하고 싶은 경우 Environment로 선언해주고 난 후 랩밸류, 디스미스 해준다.
                        }, label: {
                            Image(systemName: "xmark")
                                .font(.title3.bold())
                                .foregroundColor(.black)
                               
                        })
                        Spacer()
                    }
                    Spacer()
                    Image("Login")
                        .resizable()
                        .scaledToFit()
                        .frame(width : 200)
                        .clipShape(Circle()) // 클립셰입으로 이미지 모양을 정해서 다듬어 줄 수 있다.
                        .padding()
                    
                    Text("Let's explore the information free!")
                        .font(.body)
                        .multilineTextAlignment(.center) // 텍스트 박스 글자 정렬(가운데 정렬)
                    
                    VStack(alignment: .leading, spacing: 8){
                        HStack {
                            Text("Log in")
                                .font(.largeTitle)
                                .fontWeight(.black)
                            Spacer()
                        }
                        .padding(.bottom, 25)
                        
                        Text("User ID")
                            .font(.headline)
                        
                        TextField("E-mail Account", text: $idString) // idString의 변수와 함께 바인딩 되어서 값을 전달해준다.
                            .font((.system(size: 20, weight: .semibold)))
                            .foregroundColor(Color.black)
                            .padding(.top, 3)
                            .keyboardType(.emailAddress) // 토글키보드를 이메일 입력용으로 소환한다.
                            .autocapitalization(.none) // 알파벳 자동 대문자 기능 해제,
                            .onChange(of: idString) { //textfield에서 입력되는 문자에 따라서 콤바인 된 변수가 변하게 되는데, 이 때에 함수를 통해 불리언 값을 불러오고
                                //불려진 불리언 값으로 아이디의 준비여부를 말하는 변수의 값에 담아주었다.
                                self.isIDPrepared = checkIDString(id: $0)
                                if isIDPrepared {
                                    idStatus = .good
                                } else if $0.count == 0 {
                                    idStatus = .yet
                                } else {
                                    idStatus = .bad // 아이디가 조건만족시, 조건 불만족시, 입력이 되어있지 않을 시 세단계로 구분해서 상태를 정의하고,
                                    //물론 이 단계에서는 열거형을 통해서 상태를 정의하다.
                                }
                                
                                if isIDPrepared && isPWPrepared { // 두 조건 모두 만족시라는 연산자를 통해서 최종 로그인 준비상태 변수의 값을 넣어준다.
                                    isLoginPrepared = true
                                }
                                    
                            }
                        
                        switch idStatus {
                        case .yet:
                            Divider()
                                .background(.gray)
                        case .bad:
                            Divider()
                                .background(.red)
                        case .good:
                            Divider()
                                .background(.blue)
                        } // 뷰에서 조건에 따라서 상태를 변화시킬때는 다음과 같이 미리 스위치를 선언해서 조건에 따라서 뷰의 모습을 리턴해준다.

                        Text("User Password")
                            .font(.headline)
                            .padding(.top, 25)
                        
                        TextField("At least 8 strings", text: $passwordString)
                            .font((.system(size: 20, weight: .semibold)))
                            .foregroundColor(Color.black)
                            .autocapitalization(.none)
                            .padding(.top, 3)
                            .onChange(of: passwordString) {
                                self.isPWPrepared = checkPWString(pw: $0) // 옆에 보이는 $0는 of : 옆에 있는 상수를 지칭하고, 여기에서는 passWordString의 현상태 자체이다.
                                //(아마 콤바인하고 관련있는듯.)
                                if isPWPrepared {
                                    pwStatus = .good
                                } else if $0.count == 0 {
                                    pwStatus = .yet
                                } else {
                                    pwStatus = .bad
                                }
                                
                                if isIDPrepared && isPWPrepared {
                                    isLoginPrepared = true
                                }
                            }
                        
                        switch pwStatus {
                        case .yet:
                            Divider()
                                .background(.gray)
                        case .bad:
                            Divider()
                                .background(.red)
                        case .good:
                            Divider()
                                .background(.blue)
                        }
                        
                        HStack{
                            Spacer()
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Forget your password?")
                                    .fontWeight(.bold)
                                    .foregroundColor(.accentColor)
                            })
                            
                        }
                        .padding(.top, 5)
                        
                    }
                    .padding(.top, 25)
                    
                    Button(action: {
                        loginModel.loginAccount(email: idString, passWord: passwordString)
                        
                    }, label: {
                        Text("Log in")
                            .frame(maxWidth : .infinity)
                            .frame(height : 60)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(isLoginPrepared ? Color.accentColor : .gray)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    })
                        .disabled(isLoginPrepared == false)
                        .padding(.top, 25)
                        .padding(.bottom, 10)
                    
                }//vstack
                .padding()
            }
            
        }//zstack
    }
}

extension LoginView {
    
    func checkIDString(id : String) -> Bool {
        
        if id.count > 8 && id.contains("@"){
            return true
        } else {
            return false
        }
    }
    
    func checkPWString(pw : String) -> Bool {
        
        if pw.count > 8 {
            return true
        } else {
            return false
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
