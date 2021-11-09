//
//  Currency.swift
//  MilliArt
//
//  Created by Ivan Gorshkov on 08.11.2021.
//

import Foundation

class Currency {
    static func currency(price: Int) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.groupingSeparator = " "
        currencyFormatter.numberStyle = .decimal
        
        guard let priceString = currencyFormatter.string(from: NSNumber(value: price)) else { return "\(price)"}
        return priceString
    }
}
