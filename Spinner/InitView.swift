//
//  InitView.swift
//  ENV_SPINNER
//
//  Created by A. Blakeslee Moore on 10/24/23.
//

import SwiftUI

struct InitView: View {
    
    @Binding var loadState: LoadState
    @FocusState var focusIDField: Bool
    
    private func setRunning () {
        loadState = .running
    }
    
    var body: some View {
        VStack {
            
            Text("Welcome to\nAndrew's Spinner!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                
            Button(
                action: {setRunning()},
                label:  {Text("Tap to Spin")}
            )
            .buttonStyle(.bordered)
            .fixedSize()
            
        }
        .padding()
        .fixedSize()
        
    }
}

//#Preview {
//    return InitView()
//}
