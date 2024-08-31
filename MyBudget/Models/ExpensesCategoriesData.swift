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
    
    var firstCaregory: ExpensesCategory? {
        return userExpensesCategories.first
    }
    
    var totalCategoriesAmount: Double {
        return userExpensesCategories.reduce(0) {$0 + $1.limit}
    }
    
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
    
    func deleteCategoryAtIndex(index: IndexSet) {
        userExpensesCategories.remove(atOffsets: index)
        JSONFilesManager.writeJSONFileWith(name: expensesCategoriesFileName, data: userExpensesCategories)
    }
    
    func updateFileAfterEditing() {
        JSONFilesManager.writeJSONFileWith(name: expensesCategoriesFileName, data: userExpensesCategories)
    }

}
