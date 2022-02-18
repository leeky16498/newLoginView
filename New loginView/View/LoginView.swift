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
                            presentationMode.wrappedValue.dismiss()
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
                        .clipShape(Circle())
                        .padding()
                    
                    Text("Let's explore the information free!")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    
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
                        
                        TextField("E-mail Account", text: $idString)
                            .font((.system(size: 20, weight: .semibold)))
                            .foregroundColor(Color.black)
                            .padding(.top, 3)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .onChange(of: idString) {
                                self.isIDPrepared = checkIDString(id: $0)
                                if isIDPrepared {
                                    idStatus = .good
                                } else if $0.count == 0 {
                                    idStatus = .yet
                                } else {
                                    idStatus = .bad
                                }
                                
                                if isIDPrepared && isPWPrepared {
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
                        }

                        Text("User Password")
                            .font(.headline)
                            .padding(.top, 25)
                        
                        TextField("At least 8 strings", text: $passwordString)
                            .font((.system(size: 20, weight: .semibold)))
                            .foregroundColor(Color.black)
                            .autocapitalization(.none)
                            .padding(.top, 3)
                            .onChange(of: passwordString) {
                                self.isPWPrepared = checkPWString(pw: $0)
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
