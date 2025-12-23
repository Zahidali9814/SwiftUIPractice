//
//  Double+Extension.swift
//  SwiftUI Practice
//
//  Created by Zahid Ali on 23/12/2025.
//

import Foundation

extension Double {
    func toString() -> String {
        return String(format: "%.1f", self )
    }
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
