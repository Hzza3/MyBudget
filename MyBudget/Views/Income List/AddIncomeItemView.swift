//
//  AddIncomeItemView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import SwiftUI

struct AddIncomeItemView: View {
    
    @State private var name = ""
    @State private var amount: Double?
    @Binding var showAddIncomeView: Bool
    
    @Environment(IncomeListData.self) var incomeListData
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name" , text: $name)
                TextField("Amount", value: $amount, format: .number)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add New Income")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        guard let amount = amount else { return }
                        let newIncome = IncomeItem(id: UUID(), name: name, amount: amount)
                        incomeListData.addItemToExpensesListArray(item: newIncome)
                        showAddIncomeView = false
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showAddIncomeView = false
                    }
                }
            }
        }
     
    }
}
