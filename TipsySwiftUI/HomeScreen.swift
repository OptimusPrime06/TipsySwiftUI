//
//  ContentView.swift
//  TipsySwiftUI
//
//  Created by Gulliver Raed on 11/3/25.
//

import SwiftUI

struct HomeScreen: View {
    
    private var isSelected: Bool = false
    enum tipPercentages: String, CaseIterable {
        case zero = "0%"
        case ten = "10%"
        case twenty = "20%"
    }
    
    @State private var totalBill: Double = 0.0
    @State private var selectedTip: tipPercentages = .twenty
    @State private var split: Int = 2
    
    init() {
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
                              value: $totalBill,
                              format: .currency(code: Locale.current.currency?.identifier ?? "USD" )
                    )
                    .frame(minWidth: 100, maxWidth: 180)
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(.appDarkGreen)
                    .keyboardType(.decimalPad)
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
                
                Picker("", selection: $selectedTip) {
                    ForEach(tipPercentages.allCases, id: \.self) {
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
                    
                    Text("\(split)")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundStyle(.appDarkGreen)
                        .padding(.horizontal)
                    
                    Stepper("", value: $split, in: 2...100)
                        .padding(.horizontal)
                    
                    Spacer()
                        .frame(maxWidth: .infinity)
                    
                }
                
                Spacer()
                
                Button {
                    
                    
                    
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
                                
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(Color(red: 0.91, green: 0.98, blue: 0.95))
                
        }
        .safeAreaPadding(.all,8)
        .background(.white)
        
    }
    
    
}

#Preview {
    HomeScreen()
}

