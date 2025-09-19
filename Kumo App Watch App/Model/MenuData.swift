//
//  MenuData.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 15/09/25.
//

import Foundation
import Combine

final class MenuData: ObservableObject {
    
    enum Section: String, CaseIterable {
        case meditation = "meditation"
        case breathing = "breath"
        case reflection = "reflect"
    }
    
    let section: Section
    
    var title: String {
        switch section {
        case .meditation:
            return "Meditação"
        case .breathing:
            return "Respiração"
        case .reflection:
            return "Reflexão"
        }
    }
    
    var description: String {
        switch section {
        case .meditation:
            return "“Encontre seu equilíbrio interior diariamente com pequenas pausas para meditação.”"
        case .breathing:
            return "Exercícios simples para acalmar a mente, aliviar o stress e diminuir a ansiedade."
        case .reflection:
            return "Tire em tempo para reflitir sobre suas escolhas, seus pensamentos e suas emoções."
        }
    }
    
    
    var icon: String {
        switch section {
        case .meditation:
            return "figure.mind.and.body"
        case .breathing:
            return "aqi.medium"
        case .reflection:
            return "wind"
        }
    }
    
    @Published var timerInt: Int = 1
    
    var timerString: String {
        return timerInt == 1 ? "1 minuto" : "\(timerInt) minutos"
    }
    
    
    
    init(section: Section) {
        self.section = section
        
        let timerPreference = PreferenceManager.shared.getTimer(section: section) ?? 1
        self.timerInt = (timerPreference == 0) ? 1 : timerPreference
    }
    
    public func setTimer(timer: Int) {
        self.timerInt = timer
        PreferenceManager.shared.setTimer(section: self.section, timer: timer)
    }
    
}
