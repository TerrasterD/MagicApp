//
//  JSONHelper.swift
//  MagicAppTests
//
//  Created by victor.d.ciccarini on 05/05/21.
//

import Foundation

final class JSONHelper {

    class func getDataFrom(json file: String) -> Data? {

        guard let path = Bundle(for: JSONHelper.self).path(forResource: file, ofType: "json") else {

            fatalError("file not found / name: \(file)")

        }
        do {

            return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

        } catch {

            fatalError("malformed json / error: \(error)")

        }

    }

}
