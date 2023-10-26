//
//  GameView.swift
//  ENV_SPINNER
//
//  Created by A. Blakeslee Moore on 10/25/23.
//

import SwiftUI
import Observation


struct GameView: View {
    @Binding var loadState: LoadState
    @State private var loaded = false
    
    var body: some View {

        ZStack {
            
            LoadingRingView()
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.475) {
                        loaded = true
                    }
                }

            if loaded {
                WinView(loadState: $loadState)
            } else {
                Text("Loading...")
                    .font(.title)
                    .fontWeight(.bold)
                    .opacity(0.75)
            }

        }
        
        
    }
}

//#Preview {
//    GameView()
//}
