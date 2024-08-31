//
//  ExpensesCategoryItemView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 31/08/2024.
//

import SwiftUI

struct ExpensesCategoryItemView: View {
    
    @Environment(ExpensesListData.self) private var userExpensesData
    
    var category: ExpensesCategory
    
    var spentAmount: Double {
        return userExpensesData.getCategoryTotalSpentAmountById(catId: category.id)
    }
    
    var availableAmount: Double {
        return category.limit - userExpensesData.getCategoryTotalSpentAmountById(catId: category.id)
    }
    
    var body: some View {
        NavigationLink {
            EditExpensesCategoryView(category: category)
        } label: {
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text(category.name)
                        .font(.title3)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("\(category.limit, specifier: "%.2f") E£ ")
                        .font(.title3)
                        .fontWeight(.medium)
                }
                Text("Spent: \(spentAmount, specifier: "%.2f") E£")
                    .fontWeight(.medium)
                    .foregroundStyle(Color.red)
                Text("Available: \(availableAmount, specifier: "%.2f") E£")
                    .fontWeight(.medium)
                    .foregroundStyle(.green)
            }
        }
    }
}
