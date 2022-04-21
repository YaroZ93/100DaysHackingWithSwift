//
//  FormatStyle-LocalCurrency.swift
//  Project 7 HWS+
//
//  Created by Yaroslav Zherebukh on 3/30/22.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
