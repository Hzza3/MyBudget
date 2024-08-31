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
    
    private var incomeList: [IncomeItem] {
        return incomeListData.getUserIncomeList()
    }
    
    var body: some View {
        NavigationStack {
            List() {
                ForEach(incomeList) { incomeItem in
                    NavigationLink {
                        
                    } label: {
                        Section {
                            HStack {
                                Text("\(incomeItem.name)")
                                Spacer()
                                Text("\(incomeItem.amount, specifier: "%.2f") E£")
                            }
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    incomeListData.deleteIncomeItemAtIndex(index: indexSet)
                })
            }
            .navigationTitle("Income List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .disabled(incomeList.isEmpty)
                }
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
