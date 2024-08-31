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
    
    @State private var selectedCategory: ExpensesCategory?
    @State private var amount: Double?
    @State private var description: String = ""
    @State private var selectedPaymentMethod: PaymentMethod = .cash
    @State private var selectedDate: Date = Date.now
    @Binding var showAddExpenseItemSheet: Bool
    
    private var userCategories: [ExpensesCategory] {
        return savedUserCategoriesData.getUserExpensesCategories()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Please choose category", selection: $selectedCategory) {
                    Text("Select").tag(nil as ExpensesCategory?)
                    ForEach(userCategories) { category in
                        Text(category.name)
                            .tag(category as ExpensesCategory?)
                    }
                }
                .pickerStyle(.navigationLink)
                TextField("Amount", value: $amount, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Description", text: $description)
                
                Picker("Payment Method:", selection: $selectedPaymentMethod) {
                    ForEach(PaymentMethod.allCases, id: \.self) { method in
                        Text(method.rawValue)
                            .tag(method as PaymentMethod)
                    }
                }
                .pickerStyle(.segmented)
                DatePicker("Select Date:", selection: $selectedDate, displayedComponents: .date)
            }
            .navigationTitle("Add new Expenses")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        addExpensesItem()
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
    
    func addExpensesItem() {
        guard let selectedCategory = selectedCategory, let amount = amount else { return }
        let newExpensesItem = ExpenseItem(id: UUID(), amount: amount, category: selectedCategory, date: selectedDate, description: description, paymentMethod: selectedPaymentMethod)
        userExpensesListData.addItemToExpensesListArray(item: newExpensesItem)
        showAddExpenseItemSheet = false
    }
}
