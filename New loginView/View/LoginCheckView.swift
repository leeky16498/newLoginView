//
//  LoginCheckView.swift
//  New loginView
//
//  Created by Kyungyun Lee on 18/02/2022.
//

import SwiftUI

struct LoginCheckView: View {
    var body: some View {
        ZStack{
            
            VStack {
                LottieView()
                    .frame(width : 200, height : 200)
                
                Text("Login Success!")
                    .font(.largeTitle.bold())
                    .padding()
                
                Text("Start your information exploring!")
            }//vst
        }//zst
    }
}

struct LoginCheckView_Previews: PreviewProvider {
    static var previews: some View {
        LoginCheckView()
    }
}
