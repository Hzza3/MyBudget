//
//  ExpensesListHeaderView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import SwiftUI

struct ExpensesListHeaderView: View {
    
    @Environment(ExpensesListData.self) private var expensesListData
    
    var category: ExpensesCategory
    
    var body: some View {
        HStack {
            Text(category.name)
                .font(.headline)
            Spacer()
            Text("\(expensesListData.getCategoryTotalSpentAmountById(catId: category.id), specifier: "%.2f") / \(category.limit, specifier: "%.2f")")
                .font(.headline)
        }
    }
}
