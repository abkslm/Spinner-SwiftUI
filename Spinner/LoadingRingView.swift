////
////  LoadingRingView.swift
////  ENV_SPINNER
////
////  Created by A. Blakeslee Moore on 10/24/23.
////

import SwiftUI
import Observation

private enum Phase: CaseIterable {
    case initial
    case rotate
    case grow
    case collapse
    
    var angle: Angle {
        switch self {
        case .initial: Angle(degrees: 680)
        case .rotate: Angle(degrees: -360)
        case .grow: Angle(degrees: 300)
        case .collapse: Angle(degrees: 320)
        }
    }
    
    var scale: Double {
        switch self {
        case .initial: 0.85
        case .rotate: 1.0
        case .grow: 1.10
        case .collapse: 0.85
        }
    }
    
}

public struct LoadingRingView: View {

    @State private var startAnimation = false
    
    public var body: some View {
    
        RingView()
            .onAppear() {
                startAnimation.toggle()
            }
            .phaseAnimator(Phase.allCases, trigger: startAnimation) { content, phase in
                content
                    .rotationEffect(phase.angle)
                    .scaleEffect(phase.scale)
            } animation: { phase in
                switch phase {
                case .initial: .linear.repeatForever(autoreverses: false).speed(0.075)
                case .rotate: .smooth(duration: 3.00)
                case .grow: .smooth(duration: 0.50)
                case .collapse: .smooth(duration: 0.10)
                }
            }
        
    }
    
}

#Preview {
    LoadingRingView()
}
