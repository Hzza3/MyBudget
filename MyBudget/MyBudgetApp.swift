//
//  MyBudgetApp.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import SwiftUI

@main
struct MyBudgetApp: App {
    
    private var expensesCategoriesData = ExpensesCategoriesData()
    private var expensesListData = ExpensesListData()
    private var incomeListData = IncomeListData()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(expensesCategoriesData)
                .environment(expensesListData)
                .environment(incomeListData)
        }
    }
}
