//
//  HomeView.swift
//  New loginView
//
//  Created by Kyungyun Lee on 17/02/2022.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    @State var showLoginView : Bool = false // 로그인 뷰 스위치
    
    var body: some View {
        
                VStack {
                    Image("Background")
                        .resizable() // 조절 가능 옵션 
                        .scaledToFit() // 화면에 맞게 자동 조절
                        .frame(width : 350)
                        .padding()
                    
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Before using our fun service, \n Please login with your account first!")
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button(action: {
                        showLoginView.toggle() // 뷰 스위치 작동
                    }, label: {
                        Text("Log In")
                            .font(.headline)
                            .frame(width : 250, height : 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding()
                            .shadow(color: .gray, radius: 3, x: 3, y: 3)
                            
                    })
                        .fullScreenCover(isPresented : $showLoginView, content: LoginView.init) 
                    // UIKit에서 일반적으로 사용했던, ModalPresentation과 유사한 기능이며, content에서 마지막에 init 까먹지 말기)
          
                    
                    Button(action:  {
                        
                    }, label: {
                        Text("Create account")
                            .font(.headline)
                            .frame(width : 250, height : 50)
                            .background(.black)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 3, x: 3, y: 3)
                            
                    })
                    
            }// VStack
        }
    }

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
