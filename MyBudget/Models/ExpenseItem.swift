//
//  ExpenseItem.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import Foundation

@Observable
class ExpenseItem: Identifiable ,Codable, Hashable {
    
    var id: UUID
    var amount: Double
    var category: ExpensesCategory
    var date: Date
    var description: String
    var paymentMethod: PaymentMethod?
    
    var dateString: String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
    
    init(id: UUID, amount: Double, category: ExpensesCategory, date: Date, description: String, paymentMethod: PaymentMethod? = nil) {
        self.id = id
        self.amount = amount
        self.category = category
        self.date = date
        self.description = description
        self.paymentMethod = paymentMethod
    }
    
    static func ==(lhs: ExpenseItem, rhs: ExpenseItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
