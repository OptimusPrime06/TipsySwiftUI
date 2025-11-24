//
//  ContentView.swift
//  TipsySwiftUI
//
//  Created by Gulliver Raed on 11/3/25.
//

import SwiftUI

struct HomeScreen: View {

    //MARK: - Variables
    @StateObject private var viewModel: HomeScreenViewModel
    @FocusState private var isFocused: Bool
    @State private var viewResult: Bool = false

    //MARK: - Initializers
    init(viewModel: HomeScreenViewModel = HomeScreenViewModel()) {
        
        // ViewModel observation wrapping
        _viewModel = StateObject(wrappedValue: viewModel)
        
        // Segmented Tip Selector appearance using UIKit
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.appDarkGreen
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor : UIColor.white,
             .font : UIFont.systemFont(ofSize: 30)
            ],
            for: .selected
        )
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor : UIColor.appDarkGreen,
             .font : UIFont.systemFont(ofSize: 26)
            ],
            for: .normal
        )
    }
    
    //MARK: - UI Body
    var body: some View {
        VStack {
            VStack(alignment: .center,spacing: 12) {
                HStack {
                    Text("Enter bill total")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(.gray)
                        .padding(.leading, 40)
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                        .frame(maxWidth: .infinity)
                    
                    TextField("Bill amount",
                              value: $viewModel.totalBill,
                              format: .currency(code: Locale.current.currency?.identifier ?? "USD" )
                    )
                    .frame(minWidth: 100, maxWidth: 180)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.appDarkGreen)
                    .keyboardType(.decimalPad)
                    .focused($isFocused)
                    .padding(.bottom)
                    
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                }
            }
            .background(.white)
            
            VStack (spacing: 24) {
                HStack {
                    Text("Select tip")
                        .font(.system(size: 24, weight: .light))
                        .foregroundStyle(.gray)
                    
                    Spacer()
                }
                .padding(.horizontal, 8)
                
                Picker("", selection: $viewModel.selectedTip) {
                    ForEach(TipPercentages.allCases, id: \.self) {
                        Text($0.rawValue)
                            .padding()
                    }
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Text("Choose split")
                        .font(.system(size: 24, weight: .light))
                        .foregroundStyle(.gray)
                    
                    Spacer()
                }
                .padding(.horizontal, 8)
                
                HStack {
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                    
                    Text("\(viewModel.split)")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundStyle(.appDarkGreen)
                        .padding(.horizontal)
                    
                    Stepper("", value: $viewModel.split, in: 2...100)
                        .padding(.horizontal)
                        .shadow(color: .black, radius: 12)
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                    
                }
                
                Spacer()
                
                Button {
                    viewResult.toggle()
                } label: {
                    Text("Calculate")
                        .font(.system(size: 26, weight: .medium))
                        .foregroundStyle(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal)
                        .background(.appDarkGreen)
                        .clipShape(.rect(cornerRadius: 8))
                        .shadow(radius: 8, x: 3, y: 3)
                    
                }
                .sheet(isPresented: $viewResult) {
                    ResultScreen(viewModel: ResultViewModel(billPerPerson: viewModel.GetFinaleBill(),
                                                            numberOfPeople: viewModel.split,
                                                            tipPercent: viewModel.selectedTip))
                }
                
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(Color(red: 0.91, green: 0.98, blue: 0.95))
            
        }
        .safeAreaPadding(.all,8)
        .background(.white)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Spacer()
                    
                    Button {
                        isFocused = false
                    } label: {
                        Text("Done")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.blue)
                    }
                }
            }
        }
        
    }
    
    
}

#Preview {
    HomeScreen(viewModel: HomeScreenViewModel())
}

