//
//  DummyData.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 18.10.23.
//

import Foundation

final class DummyData {

    static let transactionModels: [TransactionsModel.Transaction] = [
        .init(
            partnerDisplayName: "DM",
            alias: .init(reference: "4257373"),
            category: 2,
            transactionDetail: .init(
                description: "Description of DM",
                bookingDate: "2022-07-23T10:59:05+0200",
                value: .init(amount: 1, currency: "PBP")
            )
        ),
        .init(
            partnerDisplayName: "Rewe",
            alias: .init(reference: "6677374"),
            category: 4,
            transactionDetail: .init(
                description: "Description of Rewe",
                bookingDate: "2022-07-21T10:59:05+0200",
                value: .init(amount: 1092, currency: "PBP")
            )
        ),
        .init(
            partnerDisplayName: "EDEKA",
            alias: .init(reference: "7377374"),
            category: 1,
            transactionDetail: .init(
                description: "Arsenal",
                bookingDate: "2022-07-24T10:59:05+0200",
                value: .init(amount: 3, currency: "PBP")
            )
        ),
        .init(
            partnerDisplayName: "Lidl",
            alias: .init(reference: "9277374"),
            category: 8,
            transactionDetail: .init(
                description: "Test test",
                bookingDate: "2022-07-22T10:59:05+0200",
                value: .init(amount: 888, currency: "PBP")
            )
        ),
        .init(
            partnerDisplayName: "Bauhaus",
            alias: .init(reference: "93338374"),
            category: 8,
            transactionDetail: .init(
                description: "Test bauhaus",
                bookingDate: "2022-07-22T10:58:05+0200",
                value: .init(amount: 23, currency: "PBP")
            )
        )
    ]
}
