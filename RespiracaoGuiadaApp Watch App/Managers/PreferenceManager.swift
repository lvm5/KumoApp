//
//  PreferenceManager.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 16/09/25.
//

import Foundation

final class PreferenceManager {
    
    static let shared = PreferenceManager()
    
    private let user = UserDefaults.standard
    
    public func setTimer(section: MenuData.Section, timer: Int) {
        self.user.set(timer, forKey: section.rawValue)
    }
    
    public func getTimer(section: MenuData.Section) -> Int? {
        self.user.integer(forKey: section.rawValue)  
    }
}
