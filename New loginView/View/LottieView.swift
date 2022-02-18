//
//  LottieView.swift
//  New loginView
//
//  Created by Kyungyun Lee on 18/02/2022.
//

import SwiftUI
import Lottie

struct LottieView : UIViewRepresentable {
    //로티뷰를 사용하기 위해서 UIViewRepresentable 로 선언하여 UIKit 연동준비
    
    typealias UIViewType = UIView //.?? typealias??
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView(frame : .zero) // 먼저 뷰 안에 애니메이션 뷰를 그려주고 이 통뷰를 소환해서 배경에 가져다 붙이는 방식으로 진행된다. 배경 뷰 선언
        
        let animationView = AnimationView() // 애니메이션 뷰 선언 
        let animation = Animation.named("95775-done-blue") // 에니매이션 뷰는 내가 사용할 로티에니메이션 뷰이며, 새로운 상수로 선언
        animationView.animation = animation // 그리고 애니메이션 뷰의 애니메이션은 내가 사용할 로티뷰 애니메이션이다.로 선언
        animationView.contentMode = .scaleAspectFit
        animationView.play() // 플레이를 해줘라.
        
        animationView.translatesAutoresizingMaskIntoConstraints = false // 로티에니메이션의 사이즈 커스텀을 위해서 레이아웃 변경 준비
        
        view.addSubview(animationView) // 선언했던 뷰에 로티 애니메이션이 들어간 애니메이션 뷰를 넣어주고
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor) // 로티 애니메이션 뷰의 프레임 크기를 커스텀 하게 선언
        ])
            
        return view // 뷰를 리턴해준다.
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
         
    }
    
}
