//
//  InfoTimerSelectView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 16/09/25.
//

import SwiftUI

struct InfoTimerSelectView: View {
    
    @Environment(\.dismiss) var dismiss
    let timers = Array(1...10)
    @ObservedObject var model: MenuData

    var body: some View {
    
        ScrollView {
            
            LazyVStack(spacing: 8.0) {
                
                ForEach(timers, id: \.self) { timer in
                    let s =  timer == 1 ? "" : "s"
                    Button("\(timer)  minuto\(s)") {
                        
                        model.setTimer(timer: timer)
                        model.timerInt = timer
                        dismiss()
                    }
                    .buttonStyle(.glass)
                }
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(model.title)
    }
}

#Preview {
    InfoTimerSelectView(model: MenuData(section: .breathing))
}
