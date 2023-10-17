//
//  Formatter+Date.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 17.10.23.
//

import Foundation

extension FormatStyle where Self == Date.FormatStyle {

    static var formattedDate: Date.FormatStyle {
        .init()
            .day(.twoDigits)
            .month(.abbreviated)
            .year()
            .locale(.current)
    }
}

extension ParseStrategy where Self == Date.ISO8601FormatStyle {

    static var apiDate: Date.ISO8601FormatStyle {
        .iso8601
        .year()
        .month()
        .day()
    }
}
