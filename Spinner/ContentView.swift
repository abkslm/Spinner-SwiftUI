//
//  ContentView.swift
//  ENV_SPINNER
//
//  Created by A. Blakeslee Moore on 10/24/23.
//

import SwiftUI

enum LoadState {
    case waiting
    case running
}

struct ContentView: View {
    
    @State var loadState = LoadState.waiting
        
    var body: some View {
        
        VStack {
            
            switch loadState {
            case .waiting: InitView(loadState: $loadState)
                    .transition(.push(from: .bottom)
                        .animation(.easeOut(duration: 0.40))
                        .combined(with: .opacity))
            case .running: GameView(loadState: $loadState)
                    .transition(.opacity.animation(.smooth(duration: 0.25)))
            }
        
        }
        .preferredColorScheme(.dark)
        
    }

}
    

#Preview {
    ContentView()
}
