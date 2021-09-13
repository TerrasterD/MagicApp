//
//  TypeRequest.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 27/04/21.
//

import Foundation

enum ExtensionRequest: TypeRequest {

    case decks

    var basePath: String {
        return "https://api.magicthegathering.io/v1"
    }
    var path: String {
        switch self {
        case .decks:
            return basePath + "/sets"
        }
    }
    var method: String {
        switch self {
        case .decks:
            return "get"
        }
    }
    var header: [String: String]? {
        switch self {
        case .decks:
            return nil
        }
    }
    var parameters: [String: String]? {
        switch self {
        case .decks:
            return nil
        }
    }
}
