//
//  AddExpensesItemView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import SwiftUI

struct AddExpensesItemView: View {
    
    @Environment(ExpensesListData.self) private var userExpensesListData
    @Environment(ExpensesCategoriesData.self) private var savedUserCategoriesData
    
    @State private var selectedCategory: ExpensesCategory = ExpensesCategoriesData.emptyExpensesCategory
    @State private var amount: Double = 0
    
    @Binding var showAddExpenseItemSheet: Bool
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Please choose category", selection: $selectedCategory) {
                    ForEach(savedUserCategoriesData.getUserExpensesCategories()) { category in
                        Text(category.name)
                            .tag(category)
                    }
                }
                TextField("Amount", value: $amount, format: .number)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new Expenses")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        if selectedCategory.name.isEmpty { return }
                        let newExpensesItem = ExpenseItem(id: UUID(), amount: amount, category: selectedCategory)
                        userExpensesListData.addItemToExpensesListArray(item: newExpensesItem)
                        showAddExpenseItemSheet = false
                    } label: {
                        Text("Save item")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        showAddExpenseItemSheet = false
                    } label: {
                        Text("Cancel")
                    }

                }
            }
        }
        
    }
}
