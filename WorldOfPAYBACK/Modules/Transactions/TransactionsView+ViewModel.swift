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

        init(transactionsManager: TransactionsManagerProtocol = TransactionsManager()) {
            self.transactionsManager = transactionsManager

            Task {
                await loadTransactions()
            }
        }

        @MainActor
        private func loadTransactions() async {
            do {
                guard let transactionsModel = try await transactionsManager.getTransactions() else {
                    return
                }
                transactions = transactionsModel.items
                loadingState = transactions.isEmpty ? .empty : .success
            } catch {
                loadingState = .failed(error.localizedDescription)
            }
        }
    }
}
