//
//  PacManShapeAnimation.swift
//  AdvanceSwiftUIBootcamp
//
//  Created by Julio Collado Perez on 4/11/23.
//

import SwiftUI

struct PacManShapeAnimation: View {
    @State private var upperMouth: Double = 0
    @State private var lowerMouth: Double = 1
    
    var body: some View {
        VStack {
            Pacman(upperMouth: upperMouth, lowerMouth: lowerMouth)
                .stroke(lineWidth: 3)
                .frame(width: 200, height: 200)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
                        upperMouth = -20
                        lowerMouth = 20
                    }
                }
        }
    }
}

struct PacManShapeAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PacManShapeAnimation()
    }
}

struct Pacman: Shape {
    var upperMouth: Double
    var lowerMouth: Double
    
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(upperMouth, lowerMouth) }
        set {
            upperMouth = newValue.first
            lowerMouth = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.height / 2,
                        startAngle: .init(degrees: upperMouth),
                        endAngle: .init(degrees: lowerMouth),
                        clockwise: true)
            path.closeSubpath()
            path.addArc(center: CGPoint(x: rect.midX, y: rect.height * 0.2),
                        radius: 10,
                        startAngle: .init(degrees: 0),
                        endAngle: .init(degrees: 360),
                        clockwise: true)
        }
    }
    
}
