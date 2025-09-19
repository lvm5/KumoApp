//
//  TextAnimationView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leadro Vansan de Morais on 19/09/25.
//

import SwiftUI

struct TextAnimationView: View {
    
    @Binding var isAnimating: Bool
    
    var body: some View {
        
        Text(isAnimating ? "Inspire" : "Expire")
            .font(.footnote)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    TextAnimationView(isAnimating: .constant(true))
}
