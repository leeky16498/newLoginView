//
//  LoginView.swift
//  New loginView
//
//  Created by Kyungyun Lee on 17/02/2022.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    @State var idStatus : IdStatus = .yet
    @State var pwStatus : PwStatus = .yet
    
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea(.all)
            if loginViewModel.singedIn == .good {
                LoginCheckView()
            } else if loginViewModel.singedIn == .fail{
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
                        
                        TextField("E-mail Account", text: $loginViewModel.idString)
                            .font((.system(size: 20, weight: .semibold)))
                            .foregroundColor(Color.black)
                            .padding(.top, 3)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
//                            .onChange(of: loginViewModel.idString) {
//                                self.isIDPrepared = loginViewModel.checkIDString(id: $0)
//                                if isIDPrepared {
//                                    idStatus = .good
//                                } else if $0.count == 0 {
//                                    idStatus = .yet
//                                } else {
//                                    idStatus = .bad
//                                }
//
//                                if isIDPrepared && isPWPrepared {
//                                    isLoginPrepared = true
//                                }
//
//                            }
                        
//                        switch loginViewModel.idStatus {
//                        case .yet:
//                            Divider()
//                                .background(.gray)
//                        case .bad:
//                            Divider()
//                                .background(.red)
//                        case .good:
//                            Divider()
//                                .background(.blue)
//                        }

                        Text("User Password")
                            .font(.headline)
                            .padding(.top, 25)
                        
                        TextField("At least 8 strings", text: $loginViewModel.passwordString)
                            .font((.system(size: 20, weight: .semibold)))
                            .foregroundColor(Color.black)
                            .autocapitalization(.none)
                            .padding(.top, 3)
//                            .onChange(of: loginViewModel.passwordString) {
//                                self.isPWPrepared = loginViewModel.checkPWString(pw: $0)
//                                if isPWPrepared {
//                                    pwStatus = .good
//                                } else if $0.count == 0 {
//                                    pwStatus = .yet
//                                } else {
//                                    pwStatus = .bad
//                                }
//                                
//                                if isIDPrepared && isPWPrepared {
//                                    isLoginPrepared = true
//                                }
//                            }
                        
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
                        loginViewModel.loginAccount(email: loginViewModel.idString, passWord: loginViewModel.passwordString)
                        
                    }, label: {
                        Text("Log in")
                            .frame(maxWidth : .infinity)
                            .frame(height : 60)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(loginViewModel.isLoginPrepared ? Color.accentColor : .gray)
                            .cornerRadius(10)
                            .shadow(color: .gray, radius: 3, x: 3, y: 3)
                    })
                    .disabled(loginViewModel.isLoginPrepared == false)
                        .padding(.top, 25)
                        .padding(.bottom, 10)
                    
                }//vstack
                .padding()
            }
            
        }//zstack
    }
}


