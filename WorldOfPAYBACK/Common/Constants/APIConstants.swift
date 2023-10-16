//
//  APIConstants.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import Foundation

// MARK: - Constants

enum Constants {}

// MARK: - API

extension Constants {

    enum API {

        static var baseUrl: String {
            switch BuildConfiguration.current {
            case .debug:
                return "https://api-test.payback.com/transactions"
            case .release:
                return "https://api.payback.com/transactions"
            }
        }
    }
}
