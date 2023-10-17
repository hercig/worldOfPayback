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

        private let transactionsManager: TransactionsManagerProtocol

        var transactionsSum: Int {
            transactions.reduce(0) { partialResult, transaction in
                partialResult + transaction.transactionDetail.value.amount
            }
        }

        init(transactionsManager: TransactionsManagerProtocol = TransactionsManager()) {
            self.transactionsManager = transactionsManager

            Task {
                await loadTransactions()
            }
        }

        @MainActor
        private func loadTransactions() async {
            do {
                transactions = try await transactionsManager.getTransactions(sorted: true)
                loadingState = transactions.isEmpty ? .empty : .success
            } catch {
                loadingState = .failed(error.localizedDescription)
            }
        }

        func handleTryAgainButtonTap() {
            loadingState = .loading
            Task { await loadTransactions() }
        }
    }
}
