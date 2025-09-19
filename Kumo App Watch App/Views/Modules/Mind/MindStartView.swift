//
//  MindStartView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 12/09/25.
//

import SwiftUI
import WatchKit

struct MindStartView: View {
    
    @ObservedObject var model: MenuData
    @Environment(\.dismiss) var dismiss
    @State var selection: Int = 1
    
    var body: some View {
        ZStack {
            background
            
            TabView(selection: $selection)  {
                
                buttonEnd
                    .tag(0)
                
                animations
                    .tag(1)
                
                MindTimerView(minutos: model.timerInt,
                              onComplete: {
                    dismiss()
                })
                    .tag(2)
                
                NowPlayingView()
                    .tag(3)
            }
            .tabViewStyle(.verticalPage)
            .navigationBarBackButtonHidden()
        }
    }
}


// MARK: -- Components
extension MindStartView {
    
    @ViewBuilder
    var background: some View {
        LinearGradient(gradient: Gradient(colors:[Color.black, Color.mint.opacity(0.08)]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
    }
    
    @ViewBuilder
    var animations: some View {
        switch model.section {
        case .meditation:
            MeditationAnimationView()
        case .breathing:
            BreathingAnimationView()
        case .reflection:
            ReflectionAnimationView()
        }
    }
    
    @ViewBuilder
    var buttonEnd: some View {
        Button("Finalizar") {
            dismiss()
        }
        .glassEffect(.regular.tint(.red.opacity(0.6)).interactive())
        .padding()
    }
}

#Preview {
    MindStartView(model: MenuData(section: .meditation))
}
