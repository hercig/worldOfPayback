//
//  ResponseHelper.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 15.10.23.
//

import Foundation

final class ResponseHelper {

    static let shared = ResponseHelper()

    private init() {}

    func loadJson<T: Decodable>(of type: T.Type, filename fileName: String) throws -> T {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(T.self, from: data)
        }

        throw NSError(domain: "No such file", code: 404)
    }
}
