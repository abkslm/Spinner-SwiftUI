//
//  RingView.swift
//  ENV_SPINNER
//
//  Created by A. Blakeslee Moore on 10/24/23.
//

import SwiftUI

extension Color {
    
    public static var outlineGreen: Color {
        return Color(red: 52/255, green: 84/255, blue: 63/255, opacity: 0.75)
    }
    
    public static var darkGreen: Color {
        return Color(red: 78/255, green: 186/255, blue: 114/255)
    }
    
    public static var lightGreen: Color {
        return Color(red: 103/255, green: 245/255, blue: 150/255);
    }
    
}

struct RingView: View {
    
    @State var trimTo: CGFloat = 0.25
    private var colors: [Color] = [Color.darkGreen, Color.lightGreen]
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .stroke(Color.outlineGreen, lineWidth: 20)
                .zIndex(0)
            
            Circle()
                .trim(from: 0, to: trimTo)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .zIndex(1)
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color.darkGreen)
                .offset(y: -150)
                .zIndex(2)
            
            
        }
        .frame(idealWidth: 300, idealHeight: 300, alignment: .center)
        .fixedSize()
        
    }
}

#Preview {
    RingView()
}
