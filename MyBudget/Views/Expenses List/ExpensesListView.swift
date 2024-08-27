//
//  ExpensesListView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import SwiftUI

struct ExpensesListView: View {
    
    @Environment(ExpensesListData.self) private var expensesListData
    @Environment(ExpensesCategoriesData.self) private var savedCategoriesData
    
    @State var showAddExpenseItemSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(savedCategoriesData.getUserExpensesCategories()) { category in
                    Section {
                        ExpensesListItemView(category: category)
                    } header: {
                        ExpensesListHeaderView(category: category)
                    }
                }
            }
            .navigationTitle("My Expenses")
            .toolbar {
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
