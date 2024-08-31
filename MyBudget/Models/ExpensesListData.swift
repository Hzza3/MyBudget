//
//  ExpensesListData.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import Foundation
import SwiftUI

@Observable
class ExpensesListData  {
    
    private let expensesListFileName = "expenses_list"

    private var userExpensesList: [ExpenseItem] = []
    
    init() {
        readUserSavedExpensesFromFile()
    }
    
    var totalSpentAmount: Double {
        userExpensesList.reduce(0){$0 + $1.amount}
    }
    
    func readUserSavedExpensesFromFile() {
        guard let userSavedExpenses: [ExpenseItem] = JSONFilesManager.readJSONFileWith(name: expensesListFileName) else { return }
        userExpensesList = userSavedExpenses
    }
    
    func getUserExpensesList() -> [ExpenseItem] {
        return userExpensesList
    }

    
    func addItemToExpensesListArray(item: ExpenseItem) {
        userExpensesList.append(item)
        JSONFilesManager.writeJSONFileWith(name: expensesListFileName, data: userExpensesList)
    }

    func deleteExpensesItemAtIndex(item: ExpenseItem) {
        var indexOfItem = userExpensesList.firstIndex(of: item)
        userExpensesList.removeAll { $0 == item }
        JSONFilesManager.writeJSONFileWith(name: expensesListFileName, data: userExpensesList)
    }
    
    func updateFileAfterEditing() {
        JSONFilesManager.writeJSONFileWith(name: expensesListFileName, data: userExpensesList)
    }
    
    func getExpensesListByCategoryId(catId: UUID) -> [ExpenseItem] {
        return userExpensesList.filter {$0.category.id == catId}
    }
    
    func getCategoryTotalSpentAmountById(catId: UUID) -> Double {
        let expensesItems = userExpensesList.filter {$0.category.id == catId }
        return expensesItems.reduce(0) { $0 + $1.amount }
    }
}
