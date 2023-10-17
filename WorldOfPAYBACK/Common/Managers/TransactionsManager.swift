//
//  TransactionsManager.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import Foundation

protocol TransactionsManagerProtocol {
    func getTransactions(sorted: Bool) async throws -> TransactionsModel?
    func getTransactionsFilters() -> [TransactionFilter]
}

final class TransactionsManager: TransactionsManagerProtocol {

    private var transactions: [TransactionsModel.Transaction] = []

    func getTransactions(sorted: Bool) async throws -> TransactionsModel? {
        let response = try ResponseHelper.shared.loadJson(of: TransactionsModel.self, filename: "PBTransactions")
        transactions = response.items

        try await Task.sleep(nanoseconds: 2 * 1_000_000_000)

        if Double.random(in: 1...10) >= 6 {
            throw NSError(domain: "Random fail!", code: 410)
        }

        return response
    }

    func getTransactionsFilters() -> [TransactionFilter] {
        return []
    }
}
