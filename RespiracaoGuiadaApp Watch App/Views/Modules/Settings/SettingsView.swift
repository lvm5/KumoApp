//
//  SettingsView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 12/09/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[Color.black, Color.mint.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("""
Desenvolvido por 
Leandro Vansan de Morais

(Versão 1.0)
""")
                .multilineTextAlignment(.center)
                .font(.footnote)
                    .bold()
                    .foregroundColor(.white)
                    //.padding()
                    .cornerRadius(10)
                    //.padding()
            }
        }
    }
}

#Preview {
    SettingsView()
}
