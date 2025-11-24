//
//  HomeScreenViewModel.swift
//  TipsySwiftUI
//
//  Created by Gulliver Raed on 11/20/25.
//

import Foundation
import SwiftUI

//MARK: - Tip Percentages Enum
enum TipPercentages: String, CaseIterable {
    case zero = "0%"
    case ten = "10%"
    case twenty = "20%"
    
    var doubleValue: Double {
    
        switch self {
        case .zero:
            return 0.0
        case .ten:
            return 0.1
        case .twenty:
            return 0.2
        }
    }
}

//MARK: - MiddleWare Protocol
protocol HomeScreenViewModelMiddleWare {
    /// Variables
    var totalBill: Double {get set}
    var selectedTip: TipPercentages {get set}
    var split: Int {get set}
    
    /// Functions
    func GetFinaleBill() -> Double
}

class HomeScreenViewModel: ObservableObject, HomeScreenViewModelMiddleWare {
    
    /// Variables
    @Published var totalBill: Double = 0.0
    @Published var selectedTip: TipPercentages = .twenty
    @Published var split: Int = 2
    
    //MARK: - Public Functions
    func GetFinaleBill() -> Double {
        let billAfterTipping = totalBill + totalBill*selectedTip.doubleValue
        let billPerPerson = billAfterTipping/Double(split)
        
        return billPerPerson
    }
    
    
}
