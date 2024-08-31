//
//  ExpensesListItemView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import SwiftUI

struct ExpensesListItemView: View {
    
    @Environment(ExpensesListData.self) private var expensesListData
    
    var item: ExpenseItem
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading, spacing: 10.0) {
                HStack {
                    Text("\(item.amount, specifier: "%.2f") E£")
                        .fontWeight(.medium)
                    Spacer()
                    Text(item.dateString)
                }
                Text(item.description)
                Text("Payment method: \(item.paymentMethod?.rawValue ?? "Cash")")
            }
        }
    }
}
