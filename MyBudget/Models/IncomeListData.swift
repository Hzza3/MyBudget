//
//  IncomeListData.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import Foundation

@Observable
class IncomeListData {
    
    private let incomeListFileName = "income_list"
    
    private var userIncomeList: [IncomeItem] = []
    
    
    init() {
        readUserSavedIncomeListFromFile()
    }
    
    func readUserSavedIncomeListFromFile() {
        guard let userSavedIncomeList: [IncomeItem] = JSONFilesManager.readJSONFileWith(name: incomeListFileName) else { return }
        userIncomeList = userSavedIncomeList
    }
    
    func getUserIncomeList() -> [IncomeItem] {
        return userIncomeList
    }
    
    
    func addItemToExpensesListArray(item: IncomeItem) {
        userIncomeList.append(item)
        JSONFilesManager.writeJSONFileWith(name: incomeListFileName, data: userIncomeList)
    }
}
