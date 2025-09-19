//
//  MindTimerView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 19/09/25.
//

import SwiftUI

struct MindTimerView: View {
    
    @StateObject private var timeManager: TimeManager
    
    init(minutos: Int,
         onComplete: @escaping () -> Void) {
        _timeManager = StateObject(wrappedValue: TimeManager(minutos: minutos,
                                                             onComplete: onComplete))
    }
    
    
    var body: some View {
        VStack(spacing: 22) {
            circleView
            buttonPlay
        }
    }
}
 
extension MindTimerView {
    
    @ViewBuilder
    var buttonPlay: some View {
        
        Button(action: didTapStart) {
            Image(systemName: timeManager.isRunning ? "pause.fill" : "play.fill")
                .frame(width: 33, height: 33)
                .glassEffect()
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    var circleView: some View {
        ZStack {
            
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.12)
            
            Circle()
                .trim(from: 0.0, to: timeManager.progress)
                .stroke(style: StrokeStyle(lineWidth: 10,
                                     lineCap: .round))
            
                .foregroundStyle(.green)
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: timeManager.progress)
            
            Text(timeManager.timer)
                .font(.title3)
                .bold()
                .frame(width: 100)
        }
    }
}

extension MindTimerView {
    private func didTapStart() {
        self.timeManager.isRunning.toggle()
    }
}


#Preview {
    MindTimerView(minutos: 1,
                  onComplete: {})
}
