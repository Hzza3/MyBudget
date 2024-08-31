//
//  PaymentMethod.swift
//  MyBudget
//
//  Created by A.Hazzaa on 31/08/2024.
//

import Foundation

enum PaymentMethod: String, Codable, CaseIterable {
    case cash = "Cash"
    case creditCard = "Credit Card"
}
