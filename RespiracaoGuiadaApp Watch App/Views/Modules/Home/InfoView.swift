//
//  InfoView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 16/09/25.
//

import SwiftUI

struct InfoView: View {
    
    @ObservedObject var model: MenuData
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(spacing: 8.0) {
                    
                    NavigationLink(model.timerString, destination: InfoTimerSelectView(model: model))
                        .buttonStyle(.glass)
                    
                    Text(model.description)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(model.title)
        }
    }
}

#Preview {
    InfoView(model: MenuData(section: .meditation))
}
