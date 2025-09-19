//
//  ReflectionAnimationView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leadro Vansan de Morais on 17/09/25.
//

import SwiftUI

struct ReflectionAnimationView: View {
    
    @State var isAnimation: Bool = false
    
    private var conts: Int = 17
    private var width: CGFloat = 120
    private var height: CGFloat = 120
    
    
    var body: some View {
        
        ZStack {
            TextAnimationView(isAnimating: $isAnimation)
                .padding(.top, 180)
    
            ZStack {
                ForEach(0..<self.conts, id: \.self) { index in
                    
                    let angle = Double(index) * (360.0 / Double(self.conts))
                    
                    animationItem
                        .offset(y: isAnimation ? -100 : -50)
                        .rotationEffect(.degrees(angle))
                        .blur(radius: isAnimation ? 0 : 8)
                }
            }
            .scaleEffect(isAnimation ? 0.5 : 0.1)
            .rotationEffect(.degrees(isAnimation ? 90 : 0))
            .onAppear {
                self.onInit()
            }
            .padding(.bottom, 55)
        }
    }
}

//MARK: - Action
extension ReflectionAnimationView {
    private func onInit() {
        withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            self.isAnimation = true
        }
    }
}

//MARK: - View
extension ReflectionAnimationView {
    @ViewBuilder
    var animationItem: some View {
        
        let gradientColors = LinearGradient(gradient: Gradient(colors: [Color.teal.opacity(0.3),  Color.green.opacity(0.8)]), startPoint: .top, endPoint: .bottom)
        
        TrianguleView()
            .fill(gradientColors)
            .frame(width: width, height: height, alignment: .center)
    }
}

//MARK: - path que cria uma forma de pétala
struct TrianguleView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        path.move(to: CGPoint(x: rect.midX,
                              y: rect.minY))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX,
                                      y: rect.maxY),
                          control: CGPoint(x: rect.minX,
                                           y: rect.minY + height * 0.5))
        
        path.addQuadCurve(to: CGPoint(x: rect.midX,
                                      y: rect.minY),
                          control: CGPoint(x: rect.maxX,
                                           y: rect.minY + height * 0.75))
        
        return path
    }
}


#Preview {
    ReflectionAnimationView()
}
