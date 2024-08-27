//
//  ExpensesCategoriesData.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import Foundation

@Observable
class ExpensesCategoriesData {
    
    private let expensesCategoriesFileName = "expenses_categories"
    
    private var userExpensesCategories: [ExpensesCategory] = []
    
    static var emptyExpensesCategory = ExpensesCategory(id: UUID(), name: "", limit: 0.0)
    
    init() {
        readUserSavedCategoriesFromFile()
    }
    
    func readUserSavedCategoriesFromFile() {
        guard let userSavedCategories: [ExpensesCategory] = JSONFilesManager.readJSONFileWith(name: expensesCategoriesFileName) else { return }
        userExpensesCategories = userSavedCategories
    }
    
    func getUserExpensesCategories() -> [ExpensesCategory] {
        return userExpensesCategories
    }

    
    func addItemToExpensesCategoriesArray(item: ExpensesCategory) {
        userExpensesCategories.append(item)
        JSONFilesManager.writeJSONFileWith(name: expensesCategoriesFileName, data: userExpensesCategories)
    }
    
}
