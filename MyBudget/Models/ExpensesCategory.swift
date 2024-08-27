//
//  ExpensesCategory.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import Foundation

class ExpensesCategory: Identifiable, Codable {
    var id: UUID
    var name: String
    var limit: Double
    
    init(id: UUID, name: String, limit: Double) {
        self.id = id
        self.name = name
        self.limit = limit
    }
}
