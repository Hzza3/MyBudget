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
    
    
    var body: some View {
        NavigationStack {
            List(categoriesData.getUserExpensesCategories()) { category in
                HStack {
                    Text(category.name)
                    Spacer()
                    Text("\(category.limit, specifier: "%.2f") E£")
                }
            }
            .navigationTitle("Categories")
            .toolbar {
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
