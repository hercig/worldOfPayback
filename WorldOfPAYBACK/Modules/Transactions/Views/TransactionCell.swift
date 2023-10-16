//
//  TransactionCell.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 16.10.23.
//

import SwiftUI

struct TransactionCell: View {

    let transactionModel: TransactionsModel.Transaction

    var body: some View {

        VStack(alignment: .leading) {
            HStack { Spacer() }
            Text(transactionModel.partnerDisplayName)
            Text(transactionModel.transactionDetail.bookingDate)
            Text(transactionModel.transactionDetail.description ?? "")
            Text("\(transactionModel.transactionDetail.value.amount) \(transactionModel.transactionDetail.value.currency)")
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

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
