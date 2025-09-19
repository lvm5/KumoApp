//
//  TimeManager.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 19/09/25.
//

import Foundation
import Combine
import SwiftUI

final class TimeManager: ObservableObject {
    
    @Published var timeRemaining: Int = 0
    @Published var isRunning: Bool = true
    
    private var totalSeconds: Int = 0
    private var onComplete: (() -> Void) = {}
    
    private var cancellables: AnyCancellable?
    
    var progress: CGFloat {
        1 - (CGFloat(self.timeRemaining) / CGFloat(self.totalSeconds))
    }
    
    var timer: String {
        let min = timeRemaining / 60
        let sec = timeRemaining % 60
        return String(format: "%02d:%02d", min, sec)
    }
    
    init(minutos: Int, onComplete: @escaping () -> Void) {
        
        self.timeRemaining = minutos * 60
        self.totalSeconds = minutos * 60
        self.onComplete = onComplete
        self.startTimer()
    }
    
    
    private func startTimer() {
        
        self.cancellables = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                
                guard let self = self, isRunning else { return }
                
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    isRunning = false
                    cancellables?.cancel()
                    onComplete()
                }
            }
    }
}
