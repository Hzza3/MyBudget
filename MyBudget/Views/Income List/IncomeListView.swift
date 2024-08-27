//
//  IncomeListView.swift
//  MyBudget
//
//  Created by A.Hazzaa on 26/08/2024.
//

import SwiftUI

struct IncomeListView: View {
    
    @Environment(IncomeListData.self) private var incomeListData

    @State private var showAddIncomeSheet = false
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(incomeListData.getUserIncomeList()) { incomeItem in
                    Section {
                        HStack {
                            Text("\(incomeItem.name)")
                            Spacer()
                            Text("\(incomeItem.amount, specifier: "%.2f") E£")
                        }
                    }
                }
            }
            .navigationTitle("Income List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddIncomeSheet = true
                    } label: {
                        Image(systemName: "plus.circle")
                    }

                }
            }
            .sheet(isPresented: $showAddIncomeSheet) {
                AddIncomeItemView(showAddIncomeView: $showAddIncomeSheet)
            }
        }
    }
}

#Preview {
    IncomeListView()
}
