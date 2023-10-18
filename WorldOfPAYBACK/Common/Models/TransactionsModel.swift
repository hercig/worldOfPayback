//
//  TransactionsModel.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import Foundation

struct TransactionsModel: Codable {
    let items: [Transaction]
}

extension TransactionsModel {

    struct Transaction: Codable, Equatable {
        let partnerDisplayName: String
        let alias: AliasModel
        let category: Int
        let transactionDetail: TransactionDetail

        static func == (lhs: TransactionsModel.Transaction, rhs: TransactionsModel.Transaction) -> Bool {
            lhs.alias.reference == rhs.alias.reference
        }
    }
    
    struct AliasModel: Codable {
        let reference: String
    }
    
    struct TransactionDetail: Codable {
        let description: String?
        let bookingDate: String
        let value: Value

        var date: Date? {
            try? Date(bookingDate, strategy: .apiDate)
        }
    }
    
    struct Value: Codable {
        let amount: Int
        let currency: String
    }
}
