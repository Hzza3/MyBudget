//
//  ExpensesCategory.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import Foundation

@Observable
class ExpensesCategory: Identifiable, Codable, Equatable, Hashable {
    var id: UUID
    var name: String
    var limit: Double
    
    init(id: UUID, name: String, limit: Double) {
        self.id = id
        self.name = name
        self.limit = limit
    }
    
    static func ==(lhs: ExpensesCategory, rhs: ExpensesCategory) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
