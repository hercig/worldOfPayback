//
//  TransactionsManager.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import Foundation

protocol TransactionsManagerProtocol {
    var transactions: [TransactionsModel.Transaction] { get set }
    func getTransactions(sorted: Bool) async throws -> [TransactionsModel.Transaction]
    func getTransactionsFilters() -> [CategoryFilter]
    func getFilteredTransactions(with filter: [CategoryFilter]) -> [TransactionsModel.Transaction]
}

final class TransactionsManager: TransactionsManagerProtocol {

    var transactions: [TransactionsModel.Transaction] = []

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

    func getTransactionsFilters() -> [CategoryFilter] {
        Array(Set(transactions.map { .init(categoryNumber: $0.category) })).sorted {
            $0.categoryNumber < $1.categoryNumber
        }
    }

    func getFilteredTransactions(with filter: [CategoryFilter]) -> [TransactionsModel.Transaction] {
        let categories = filter.compactMap { $0.isActive ? $0.categoryNumber : nil }
        return categories.isEmpty ? transactions : transactions.filter { categories.contains($0.category) }
    }
}
