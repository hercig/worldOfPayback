//
//  TransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 12.10.23.
//

import SwiftUI

struct TransactionsView: View {

    @StateObject var viewModel: ViewModel

    var body: some View {

        switch viewModel.loadingState {
        case .loading:
            ProgressView()
        case .success:
            contentView
        case .failed(let error):
            Text("Error: \(error)")
        case .empty:
            Text("No transactions")
        }
    }
}

extension TransactionsView {

    var contentView: some View {
        VStack {
            Text("Transactions")

            List(viewModel.transactions, id: \.alias.reference) { transaction in
                TransactionCell(transactionModel: transaction)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
        }
        .background(.gray)
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(viewModel: .init())
    }
}
