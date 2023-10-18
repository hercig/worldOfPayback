//
//  TransactionCell.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 16.10.23.
//

import SwiftUI

struct TransactionCell: View {

    // MARK: Init Properties

    let transactionModel: TransactionsModel.Transaction

    // MARK: View

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(transactionModel.partnerDisplayName)
                        .font(.title3)
                    Text(transactionModel.transactionDetail.date!.formatted(.formattedDate))
                        .foregroundStyle(.gray)
                        .font(.caption)
                    Text(transactionModel.transactionDetail.description ?? "")
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("\(transactionModel.transactionDetail.value.amount)")
                        .font(.title)
                        .foregroundStyle(Assets.Colors.primary.swiftUIColor)
                        .fontWeight(.bold)
                    Text(transactionModel.transactionDetail.value.currency)
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

// MARK: - Preview

struct TransactionCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCell(transactionModel: .init(
            partnerDisplayName: "Rewe",
            alias: .init(reference: "7377373"),
            category: 1,
            transactionDetail: .init(
                description: "Descp",
                bookingDate: "2022-12-10",
                value: .init(amount: 4, currency: "PBP")
            )
        ))
    }
}
