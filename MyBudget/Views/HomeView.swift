//
//  HomeView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ExpensesListView()
                .tabItem {
                    Label("Expenses", image: "spending")
                }
            IncomeListView()
                .tabItem {
                    Label("Income", image: "salary")
                }
            ExpensesCategoriesListView()
                .tabItem {
                    Label("Categories", image: "categories")
                }
        }
        
    }
}

#Preview {
    HomeView()
}
