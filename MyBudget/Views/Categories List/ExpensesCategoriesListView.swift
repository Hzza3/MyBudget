//
//  ExpensesCategoriesList.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import SwiftUI

struct ExpensesCategoriesListView: View {
    
    @Environment(ExpensesCategoriesData.self) private var categoriesData
    
    @State var showAddSheet: Bool = false
    
    private var userCategories: [ExpensesCategory] {
        return categoriesData.getUserExpensesCategories()
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15.0) {
                Text("Total Budget: \(categoriesData.totalCategoriesAmount, specifier: "%.2f")")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.green)
                    .padding(.horizontal, 15)
                List {
                    ForEach(userCategories) { category in
                        Section {
                            ExpensesCategoryItemView(category: category)
                        }
                    }
                    .onDelete(perform: { indexset in
                        categoriesData.deleteCategoryAtIndex(index: indexset)
                    })
                }
            }
            .navigationTitle("My Plan")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .disabled(userCategories.isEmpty)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showAddSheet.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
                
            }
            .sheet(isPresented: $showAddSheet) {
                AddCategoryView(showAddCategory: $showAddSheet)
            }
        }
    }
}

#Preview {
    ExpensesCategoriesListView()
}
