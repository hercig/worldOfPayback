//
//  TransactionsView+ViewModel.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import SwiftUI

extension TransactionsView {

    final class ViewModel: ObservableObject {

        private let transactionsManager: TransactionsManagerProtocol

        // MARK: Published Properties

        @Published var transactions: [TransactionsModel.Transaction] = []
        @Published var loadingState: LoadingState = .loading
        @Published var isFiltersViewPresented: Bool = false
        @Published var categoryFilters: [CategoryFilter] = [] {
            didSet {
                transactions = transactionsManager.getFilteredTransactions(with: categoryFilters)
            }
        }

        // MARK: Computed Properties

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
        func loadTransactions() async {
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
    }
}
