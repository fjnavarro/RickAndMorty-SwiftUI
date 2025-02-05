//
//  AlertModifier.swift
//  RickAndMorty-SwiftUI
//
//  Created by Francisco José Navarro García on 03.02.2025.
//

import SwiftUI

struct AlertModifier: ViewModifier {
    let message: String
    
    @Binding var showAlert: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black.opacity(0.5))
                    
                    VStack {
                        Text(message)
                            .multilineTextAlignment(.center)
                        HStack {
                            Button(role: .cancel) {
                                showAlert.toggle()
                            } label: {
                                Text("Cancel")
                            }
                            Button {
                                showAlert.toggle()
                            } label: {
                                Text("OK")
                            }
                        }
                    }
                    .buttonStyle(.bordered)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(white: 0.9))
                            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 10)
                    }
                    .offset(y: showAlert ? 0.0 : 300)
                }
                .opacity(showAlert ? 1.0 : 0.0)
                .animation(.default, value: showAlert)
                .ignoresSafeArea()
            }
        
    }
}
