//
//  WinView.swift
//  ENV_SPINNER
//
//  Created by A. Blakeslee Moore on 10/24/23.
//

import SwiftUI

enum WinStatus {
    case win
    case loss
    
    var text: String {
        switch self {
        case .win: "You Won!"
        case .loss: "You Lost!"
        }
    }
}

struct WinView: View {
    
    @Binding var loadState: LoadState
    @State private var winStatus: WinStatus = .loss
    
    private func setWaiting () {
        loadState = .waiting
    }
    
    private func genWinStatus () {
        let spinVal = Int.random(in: 1...4)
        winStatus = spinVal == 1 ? .win : winStatus
    }
        
    var body: some View {
        
        VStack{
            
            Text(winStatus.text)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Button(action: setWaiting, label: {Text("Reset")})
                .buttonStyle(.bordered)
            
        }
        .padding()
        .fixedSize()
        .alignmentGuide(VerticalAlignment.center, computeValue: { _ in 40})
        .transition(.asymmetric(insertion: .opacity.animation(.easeIn),
                                removal: .scale))
        .onTapGesture(perform: {setWaiting()})
        .onAppear() {genWinStatus()}

    }
    
}

//#Preview {
//    WinView()
//}
