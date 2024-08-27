//
//  ExpensesListItemView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import SwiftUI

struct ExpensesListItemView: View {
    
    @Environment(ExpensesListData.self) private var expensesListData
    
    var category: ExpensesCategory

    var body: some View {
        let categoryExpensesItems = expensesListData.getExpensesListByCategoryId(catId: category.id)
        ForEach(categoryExpensesItems) { expenseItem in
            HStack {
                Text("\(expenseItem.amount, specifier: "%.2f") E£")
            }
        }
    }
}
