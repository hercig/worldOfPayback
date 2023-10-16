//
//  TransactionsManager.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import Foundation

protocol TransactionsManagerProtocol {
    func getTransactions() async throws -> TransactionsModel?
}

final class TransactionsManager: TransactionsManagerProtocol {

    func getTransactions() async throws -> TransactionsModel? {
        try ResponseHelper.shared.loadJson(of: TransactionsModel.self, filename: "PBTransactions")
    }
}
