//
//  TransactionsViewModelTest.swift
//  WorldOfPAYBACKTests
//
//  Created by Filip Hercig on 18.10.23.
//

import XCTest
@testable import WorldOfPAYBACK

final class TransactionsViewModelTest: XCTestCase {

    private var sut: TransactionsView.ViewModel!

    override func setUp() {
        super.setUp()

        sut = TransactionsView.ViewModel()
        sut.transactions = WorldOfPAYBACK.DummyData.transactionModels
    }

    func testGettingTransactionSum() {
        let expectedResults = 114
        XCTAssertEqual(sut.transactionsSum, expectedResults)

        sut.transactions = []
        XCTAssertEqual(sut.transactionsSum, 0)
    }
}
