//
//  Assets+Colors.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 12.10.23.
//

import SwiftUI

extension Assets {

    enum Colors: String {

        case primary
        case secondary
        case background

        var swiftUIColor: Color {
            Color(self.rawValue)
        }
    }
}
