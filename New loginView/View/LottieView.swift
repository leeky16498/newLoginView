//
//  LottieView.swift
//  New loginView
//
//  Created by Kyungyun Lee on 18/02/2022.
//

import SwiftUI
import Lottie

struct LottieView : UIViewRepresentable {
    
    typealias UIViewType = UIView // 여기에다가 이거를 추가했습니다.
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        
        let view = UIView(frame : .zero)
        
        let animationView = AnimationView()
        let animation = Animation.named("95775-done-blue")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
            
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
         
    }
    
}
