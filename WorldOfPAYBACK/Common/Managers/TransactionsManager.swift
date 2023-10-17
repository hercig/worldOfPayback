//
//  TransactionsManager.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import Foundation

protocol TransactionsManagerProtocol {
    func getTransactions(sorted: Bool) async throws -> [TransactionsModel.Transaction]
    func getTransactionsFilters() -> [TransactionFilter]
}

final class TransactionsManager: TransactionsManagerProtocol {

    private var transactions: [TransactionsModel.Transaction] = []

    func getTransactions(sorted: Bool) async throws -> [TransactionsModel.Transaction] {
        let response = try ResponseHelper.shared.loadJson(of: TransactionsModel.self, filename: "PBTransactions")
        transactions = response.items

        transactions = transactions.compactMap { item in
            guard item.transactionDetail.date != nil else { return nil }
            return item
        }

        transactions.sort { first, second in
            first.transactionDetail.date! > second.transactionDetail.date!
        }

        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)

        if Double.random(in: 1...10) >= 8 {
            throw NSError(domain: "Random fail!", code: 410)
        }

        return transactions
    }

    func getTransactionsFilters() -> [TransactionFilter] {
        return []
    }
}
