//
//  ExpenseItem.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import Foundation

class ExpenseItem: Identifiable ,Codable {
    var id: UUID
    var amount: Double
    var category: ExpensesCategory
    
    init(id: UUID, amount: Double, category: ExpensesCategory) {
        self.id = id
        self.amount = amount
        self.category = category
    }
}
