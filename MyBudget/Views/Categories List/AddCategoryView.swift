//
//  AddCategoryView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import SwiftUI

struct AddCategoryView: View {
    
    @State private var name = ""
    @State private var amount = 0.0
    @Binding var showAddCategory: Bool
    @Environment(ExpensesCategoriesData.self) var categoriesData
    
    var body: some View {
        
        NavigationStack {
            Form {
                TextField("Name" , text: $name)
                TextField("Amount", value: $amount, format: .number)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Category")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                       addNewCategory()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showAddCategory = false
                    }
                }
            }
        }
    }
    
    func addNewCategory() {
        let newCategory = ExpensesCategory(id: UUID(), name: name, limit: amount)
        categoriesData.addItemToExpensesCategoriesArray(item: newCategory)
        showAddCategory = false
    }
}
