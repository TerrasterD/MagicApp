//
//  Decks.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 27/04/21.
//

import Foundation

struct Deck: Decodable {
    let setsA: [Set]

    enum CodingKeys: String, CodingKey {
        case setsA = "sets"
    }
}

struct Set: Decodable {
    let code, name, type, releaseDate: String
    let block, magicCardsInfoCode, mkmName, border: String?
    let mkmID: Int?
    // let booster: [Booster]?

    enum CodingKeys: String, CodingKey {
        case code, name, type, border
        case mkmID = "mkm_id"
        // case booster
        case mkmName = "mkm_name"
        case releaseDate, magicCardsInfoCode, block
    }

}

// enum Booster: Decodable{
//
//    case string(String)
//    case arrayString([String])
//
//    init(from decoder: Decoder)throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode([String].self){
//            self = .arrayString(x)
//        }
//        if let x = try? container.decode(String.self){
//            self = .string(x)
//        }
//        throw DecodingError.typeMismatch(Booster.self, DecodingError.Context(
//  codingPath: decoder.codingPath,
//  debugDescription: "Wrong type for booster"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .string(let x):
//            try container.encode(x)
//        case .arrayString(let x):
//            try container.encode(x)
//        }
//    }
//
// }
