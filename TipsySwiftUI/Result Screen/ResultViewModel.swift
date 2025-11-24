//
//  ResultViewModel.swift
//  TipsySwiftUI
//
//  Created by Gulliver Raed on 11/24/25.
//

import SwiftUI

//MARK: - MiddleWare Protocol
protocol ResultViewModelMiddleWare {
    func getBillPerPerson() -> String
    func getNumberOfPeople() -> String
    func getTipPercent() -> String
}

class ResultViewModel: ResultViewModelMiddleWare {
    
    //MARK: - Variables
    private var billPerPerson: Double
    private var numberOfPeople: Int
    private var tipPercent: TipPercentages
    
    //MARK: - Initializer
    init(billPerPerson: Double, numberOfPeople: Int, tipPercent: TipPercentages) {
        self.billPerPerson = billPerPerson
        self.numberOfPeople = numberOfPeople
        self.tipPercent = tipPercent
    }
    
    //MARK: - Public Functions
    func getBillPerPerson() -> String {
        return "\(billPerPerson)"
    }
    
    func getNumberOfPeople() -> String {
        return "\(numberOfPeople)"
    }
    
    func getTipPercent() -> String {
        return tipPercent.rawValue
    }
}
