//
//  TransactionsManagerTest.swift
//  TransactionsManagerTest
//
//  Created by Filip Hercig on 12.10.23.
//

import XCTest
@testable import WorldOfPAYBACK

final class TransactionsManagerTest: XCTestCase {

    var sut: TransactionsManagerProtocol!

    override func setUp() {
        sut = TransactionsManager()
        sut.transactions = DummyData.transactionModels
    }

    func testGettingTransactionsFilters() {
        let expectedResults: [CategoryFilter] = [
            .init(categoryNumber: 1),
            .init(categoryNumber: 2),
            .init(categoryNumber: 4),
            .init(categoryNumber: 8)
        ]

        XCTAssertEqual(sut.getTransactionsFilters(), expectedResults)
    }

    func testGettingFilteredTransactions() {
        let expectedResults: [TransactionsModel.Transaction] = [
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

        var filters: [CategoryFilter] = [.init(categoryNumber: 8, isActive: true)]
        XCTAssertEqual(sut.getFilteredTransactions(with: filters), expectedResults)

        filters = []
        XCTAssertEqual(sut.getFilteredTransactions(with: filters), DummyData.transactionModels)
    }
}
