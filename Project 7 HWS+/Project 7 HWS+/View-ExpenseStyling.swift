//
//  View-ExpenseStyling.swift
//  Project 7 HWS+
//
//  Created by Yaroslav Zherebukh on 3/30/22.
//

import Foundation
import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.font(.body)
        } else if item.amount < 100 {
            return self.font(.title3)
        } else {
            return self.font(.title)
        }
    }
}
