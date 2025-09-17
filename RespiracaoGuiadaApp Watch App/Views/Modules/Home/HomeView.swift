//
//  HomeView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 12/09/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var meditation = MenuData(section: .meditation)
    @StateObject var reflection = MenuData(section: .reflection)
    @StateObject var breathing = MenuData(section: .breathing)
    
    var body: some View {
        NavigationStack {
            ZStack {
                background
                
                TabView  {
                    
                    MenuItemView(model: self.breathing)
                    MenuItemView(model: self.reflection)
                    MenuItemView(model: self.meditation)
                    
                    VStack(spacing: 8) {
                        
                        NavigationLink("Sobre",
                                       destination: AboutView())
                        .buttonStyle(.glass)
                        
                        NavigationLink("Desenvolvimento",
                                       destination: SettingsView())
                        .buttonStyle(.glass)
                        
                    }
                    .padding()
                }
                .tabViewStyle(.verticalPage)
            }
        }
    }
}

// MARK: - Components
extension HomeView {
    
    @ViewBuilder
    var background: some View {
        LinearGradient(gradient: Gradient(colors:[Color.black, Color.mint.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
