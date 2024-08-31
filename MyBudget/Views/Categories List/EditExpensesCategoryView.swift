//
//  EditExpensesCategoryView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 28/08/2024.
//

import SwiftUI

struct EditExpensesCategoryView: View {
    
    @Environment(ExpensesCategoriesData.self) private var categoriesData
    
    @Bindable var category: ExpensesCategory
    
    @State private var limit: Double = 0.0
    @State private var name: String = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name" , text: $name)
                TextField("Amount", value: $limit, format: .number)
                    .keyboardType(.decimalPad)
            }
            .onAppear {
                name = category.name
                limit = category.limit
            }
            .navigationTitle("Add New Category")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        editExpenseCategory()
                    }
                }
            }
        }
    }
    
    func editExpenseCategory() {
        category.name = name
        category.limit = limit
        categoriesData.updateFileAfterEditing()
        dismiss()
    }
}
