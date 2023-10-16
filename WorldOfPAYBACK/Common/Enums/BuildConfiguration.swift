//
//  BuildConfiguration.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import Foundation

enum BuildConfiguration: CaseIterable {

    case debug
    case release
}

extension BuildConfiguration {

    static var current: BuildConfiguration {

        #if Debug
            return .debug
        #elseif Release
            return .release
        #else
            preconditionFailure("build configuration can not be determined!")
        #endif
    }
}
