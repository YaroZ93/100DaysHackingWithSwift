//
//  ExpenseItem.swift
//  Project 7 HWS+
//
//  Created by Yaroslav Zherebukh on 3/29/22.
//

import Foundation


struct ExpenseItem: Identifiable, Codable, Equatable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
