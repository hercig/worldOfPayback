//
//  TransactionsView+ViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import SwiftUI

extension TransactionsView {

    final class ViewModel: ObservableObject {

        @Published var transactions: [TransactionsModel.Transaction] = []
        @Published var loadingState: LoadingState = .loading
        @Published var isFiltersViewPresented: Bool = false
        @Published var categoryFilters: [CategoryFilter] = [] {
            didSet {
                transactions = transactionsManager.getFilteredTransactions(with: categoryFilters)
            }
        }

        private let transactionsManager: TransactionsManagerProtocol

        var transactionsSum: Int {
            transactions.reduce(0) { partialResult, transaction in
                partialResult + transaction.transactionDetail.value.amount
            }
        }

        // MARK: Init

        init(transactionsManager: TransactionsManagerProtocol = TransactionsManager()) {
            self.transactionsManager = transactionsManager

            Task {
                await loadTransactions()
            }
        }

        // MARK: Private methods

        @MainActor
        private func loadTransactions() async {
            do {
                transactions = try await transactionsManager.getTransactions(sorted: true)
                categoryFilters = transactionsManager.getTransactionsFilters()
                loadingState = transactions.isEmpty ? .empty : .success
            } catch {
                loadingState = .failed(error.localizedDescription)
            }
        }

        // MARK: Public methods

        func handleTryAgainButtonTap() {
            loadingState = .loading
            Task { await loadTransactions() }
        }

        func handleTransactionTap(_ transaction: TransactionsModel.Transaction) {
            print("transaction")
        }
    }
}
