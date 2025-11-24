//
//  ResultScreen.swift
//  TipsySwiftUI
//
//  Created by Gulliver Raed on 11/20/25.
//

import SwiftUI

struct ResultScreen: View {
    
    //MARK: - Variables
    private var viewModel: ResultViewModelMiddleWare
    @Environment(\.dismiss) var dismiss
    
    //MARK: - Initializers
    init(viewModel: ResultViewModelMiddleWare) {
        self.viewModel = viewModel
    }
        
    //MARK: - Body
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                VStack(spacing: 16) {
                    Spacer()
                        .frame(height: 120)
                    
                    Text("Total bill per person")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                    
                    Text(viewModel.getBillPerPerson())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.appDarkGreen)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 16)
                .ignoresSafeArea(edges: .horizontal)
                
                
                VStack(spacing: 16) {
                    Text("Split between \(viewModel.getNumberOfPeople()) with \(viewModel.getTipPercent()) tip")
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.top)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Recalculate")
                            .font(.system(size: 26, weight: .medium))
                            .foregroundStyle(.white)
                            .padding(.vertical, 6)
                            .padding(.horizontal)
                            .background(.appDarkGreen)
                            .clipShape(.rect(cornerRadius: 8))
                            .shadow(radius: 8, x: 3, y: 3)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.appLightGreen)
            }
        }
    }
}

//MARK: - Preview
#Preview {
    ResultScreen(viewModel: ResultViewModel(billPerPerson: 10.0,
                                            numberOfPeople: 2,
                                            tipPercent: .ten))
}
