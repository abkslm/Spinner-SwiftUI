//
//  RotatingRingView.swift
//  ENV_SPINNER
//
//  Created by A. Blakeslee Moore on 10/24/23.
//

import SwiftUI

struct RotatingRingView: View {
    @State private var isRotating = 0.0
    
    var body: some View {
        
        RingView()
            .fixedSize()
            .rotationEffect(.degrees(isRotating))
            .onAppear() {
                withAnimation(.linear(duration: 1)
                    .speed(1.00)
                    .repeatForever(autoreverses: false)) {
                        isRotating = 360.00
                }
            }
        
    }
}

#Preview {
    RotatingRingView()
}
