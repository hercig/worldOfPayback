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

    struct Transaction: Codable {
        let partnerDisplayName: String
        let alias: AliasModel
        let category: Int
        let transactionDetail: TransactionDetail
    }
    
    struct AliasModel: Codable {
        let reference: String
    }
    
    struct TransactionDetail: Codable {
        let description: String?
        let bookingDate: String
        let value: Value
    }
    
    struct Value: Codable {
        let amount: Int
        let currency: String
    }
}
