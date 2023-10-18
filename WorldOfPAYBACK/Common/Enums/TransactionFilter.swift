//
//  TransactionFilter.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 17.10.23.
//

import SwiftUI

struct CategoryFilter: Identifiable, Hashable {

    let categoryNumber: Int
    var isActive: Bool = false

    var id: Int {
        categoryNumber
    }
}
