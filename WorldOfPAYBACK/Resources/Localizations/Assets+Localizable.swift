//
//  Assets+Localizable.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 18.10.23.
//

import SwiftUI

extension Assets {

    enum Localizable: String {
        case transactions
        case tryAgain
        case noInternetError
        case totalSum
        case noTransactionsError
        case filtersTitle
        case filtersHintMessage
        case filtersWarningMessage

        var localized: LocalizedStringKey {
            LocalizedStringKey(self.rawValue)
        }
    }
}
