//
//  BreathingAnimationView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 17/09/25.
//

import SwiftUI

struct BreathingAnimationView: View {
    
    @State var isAnimation: Bool = false
    
    private var conts: Int = 13
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
            .scaleEffect(isAnimation ? 0.5 : 0.05)
            .onAppear {
                self.onInit()
            }
            .padding(.bottom, 55)
        }
    }
}

//MARK: - Action
extension BreathingAnimationView {
    private func onInit() {
        withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            self.isAnimation = true
        }
    }
}

//MARK: - View
extension BreathingAnimationView {
    @ViewBuilder
    var animationItem: some View {
        
        let gradientColors = LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8),  Color.cyan.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
        
        Circle()
            .fill(gradientColors)
            .frame(width: width, height: height, alignment: .center)
    }
}

#Preview {
    BreathingAnimationView()
}
