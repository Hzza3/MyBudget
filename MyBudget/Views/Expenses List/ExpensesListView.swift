//
//  ExpensesListView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import SwiftUI

struct ExpensesListView: View {
    
    @Environment(ExpensesListData.self) private var expensesListData
    @State var showAddExpenseItemSheet: Bool = false
    
    private var userExpensesList: [ExpenseItem] {
        return expensesListData.getUserExpensesList()
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Total expenses: \(expensesListData.totalSpentAmount, specifier: "%.2f")")
                    .font(.title3)
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.green)
                    .padding(.leading, 15)
                List {
                    ForEach(userExpensesList.sorted{$0.date > $1.date}) { expenseItem in
                        ExpensesListItemView(item: expenseItem)
                    }
                    .onDelete(perform: { indexSet in
                        expensesListData.deleteExpensesItemAtIndex(index: indexSet)
                    })
                }
            }
            .navigationTitle("My Expenses")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .disabled(userExpensesList.isEmpty)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddExpenseItemSheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $showAddExpenseItemSheet) {
                AddExpensesItemView(showAddExpenseItemSheet: $showAddExpenseItemSheet)
            }
        }
    }
}

#Preview {
    ExpensesListView()
}
