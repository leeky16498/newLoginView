//
//  HomeView.swift
//  New loginView
//
//  Created by Kyungyun Lee on 17/02/2022.
//

import SwiftUI
import UIKit

struct HomeView: View {
    
    @State var showLoginView : Bool = false
    
    var body: some View {
        
                VStack {
                    Image("Background")
                        .resizable()
                        .scaledToFit()
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
                        showLoginView.toggle()
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
