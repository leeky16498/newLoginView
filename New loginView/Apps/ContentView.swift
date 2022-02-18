//
//  ContentView.swift
//  New loginView
//
//  Created by Kyungyun Lee on 17/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("ColorBackground")
                .ignoresSafeArea(.all)
            HomeView()
        }
    }
}

// Custom half sheet modifier


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
