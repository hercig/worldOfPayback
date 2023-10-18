//
//  TransactionDetailsView.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 18.10.23.
//

import SwiftUI

struct TransactionDetailsView: View {

    // MARK: Init Properties

    let transaction: TransactionsModel.Transaction

    // MARK: View

    var body: some View {
        VStack {
            Text(transaction.partnerDisplayName)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(Assets.Colors.primary.swiftUIColor)
            if let description = transaction.transactionDetail.description {
                Text(description)
            }
        }
    }
}

// MARK: - Preview

struct TransactionDetailsView_Preview: PreviewProvider {
    static var previews: some View {
        TransactionDetailsView(
            transaction: .init(
                partnerDisplayName: "REWE",
                alias: .init(reference: "83928329"),
                category: 2,
                transactionDetail: .init(
                    description: nil,
                    bookingDate: "2022-12-12",
                    value: .init(amount: 12, currency: "PBP")
                )
            )
        )
    }
}
