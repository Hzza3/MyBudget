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
    
    private var sortedUserExpensesList: [ExpenseItem] {
        return expensesListData.getUserExpensesList().sorted { $0.date > $1.date}
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
                    ForEach(sortedUserExpensesList) { expenseItem in
                        ExpensesListItemView(item: expenseItem)
                    }
                    .onDelete(perform: { indexSet in
                       deleteItems(at: indexSet)
                    })
                }
            }
            .navigationTitle("My Expenses")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .disabled(sortedUserExpensesList.isEmpty)
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
    
    private func deleteItems(at offsets: IndexSet) {
          // Convert IndexSet to an array of indices
          let indicesToDelete = offsets.sorted()
          // Iterate over indices and delete the corresponding items
          for index in indicesToDelete.reversed() {
              let itemToDelete = sortedUserExpensesList[index]
              expensesListData.deleteExpensesItemAtIndex(item: itemToDelete)
          }
      }
}

#Preview {
    ExpensesListView()
}
