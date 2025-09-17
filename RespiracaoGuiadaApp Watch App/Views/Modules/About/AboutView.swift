//
//  AboutView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 12/09/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[Color.black, Color.mint.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("Sobre o App")
                        .multilineTextAlignment(.center)
                        .font(.callout)
                        .bold()
                        .padding(.bottom)
                    
                    Text("""
•  MEDITAÇÃO:  foco e equilíbrio em sessões curtas.

•  RESPIRAÇÃO:  exercícios rápidos para reduzir o estresse.

•  REFLEXÃO:  pausas para organizar ideias e registrar pensamentos.
                     
""")
                    .multilineTextAlignment(.leading)
                    .font(.custom("footnote", size: 12))

                    Text("Prático e intuitivo, é o companheiro ideal para cuidar da mente no Apple Watch.")
                    .multilineTextAlignment(.leading)
                    .font(.custom("footnote", size: 12))
                }
                .padding()
            }
        }
    }
}

#Preview {
    AboutView()
}
