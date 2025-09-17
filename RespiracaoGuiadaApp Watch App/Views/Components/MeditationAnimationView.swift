//
//  MeditationView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leadro Vansan de Morais on 17/09/25.
//

import SwiftUI

struct MeditationAnimationView: View {
    
    @State var isAnimation: Bool = false
    
    private var conts: Int = 23
    private var width: CGFloat = 120
    private var height: CGFloat = 120
    
    
    var body: some View {
        ZStack {
            
            ForEach(0..<self.conts, id: \.self) { index in
                
                let angle = Double(index) * (360.0 / Double(self.conts))
                
                animationItem
                    .offset(y: isAnimation ? -100 : -50)
                    .rotationEffect(.degrees(angle))
                    .blur(radius: isAnimation ? 0 : 8)
            }
        }
        .scaleEffect(isAnimation ? 0.6 : 0.1)
        .rotationEffect(.degrees(isAnimation ? 180 : 0))

        .onAppear {
            self.onInit()
        }
    }
}

//MARK: - Action
extension MeditationAnimationView {
    private func onInit() {
        withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            self.isAnimation = true
        }
    }
}

//MARK: - View
extension MeditationAnimationView {
    @ViewBuilder
    var animationItem: some View {
        
        let gradientColors = LinearGradient(gradient: Gradient(colors: [Color.cyan.opacity(0.5),  Color.purple.opacity(0.9)]), startPoint: .top, endPoint: .bottom)
        
        RoundedRectangle(cornerRadius: 7)
            .fill(gradientColors)
            .frame(width: width, height: height, alignment: .center)
    }
}

#Preview {
    MeditationAnimationView()
}
