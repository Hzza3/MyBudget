//
//  IncomeItem.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import Foundation

@Observable
class IncomeItem: Identifiable, Codable {
    var id: UUID
    var name: String
    var amount: Double
    
    init(id: UUID, name: String, amount: Double) {
        self.id = id
        self.name = name
        self.amount = amount
    }
}
