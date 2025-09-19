//
//  MenuItemView.swift
//  RespiracaoGuiadaApp Watch App
//
//  Created by Leandro Vansan de Morais on 12/09/25.
//

import SwiftUI

struct MenuItemView: View {
    
    @ObservedObject var model: MenuData
    @State var isInfo: Bool = false
    
    var body: some View {
        
        HStack {
            
            leftSideView
            
            Spacer()
            
            rightSideView
            
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $isInfo, content: {
            InfoView(model: model)
        })
    }
}
    
    // MARK: -- Components
    extension MenuItemView {
        
        /// Right side
        @ViewBuilder
        var rightSideView: some View {
            
            Button(action: tapMoreButton) {
                
                VStack {
                    Image(systemName: "ellipsis.circle.fill")
                        .foregroundColor(.mint.opacity(0.5))
                    
                    Spacer()
                    
                }
            }
            .buttonStyle(.plain)
            .padding()
        }
        
        /// Left side
        @ViewBuilder
        var leftSideView: some View {
            NavigationLink(destination: MindStartView(model: model)) {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Image(systemName: model.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                        .foregroundColor(.mint.opacity(0.5))
                        .accessibilityLabel("Icone \(model.title)")
                    
                    Text(model.title)
                        .bold()
                        .accessibilityLabel("Titulo \(model.title)")

                    
                    Text(model.timerString)
                        .font(.footnote)
                        .foregroundColor(.mint.opacity(0.5))
                        .accessibilityLabel("Tempo \(model.timerString)")

                }
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Botão de seleção")
            .padding()
        }
    }
    
    // MARK: -- Actions
    extension MenuItemView {
        private func tapMoreButton() {
            self.isInfo = true
        }
    }
    
    #Preview {
        MenuItemView(model: MenuData(section: .meditation))
    }
