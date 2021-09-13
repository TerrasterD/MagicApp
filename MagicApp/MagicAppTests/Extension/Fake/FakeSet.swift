//
//  FakeSet.swift
//  MagicAppTests
//
//  Created by victor.d.ciccarini on 05/05/21.
//

import Foundation

@testable import MagicApp
extension Set {

    static func fakeExpansion1(
        code: String = "5DN",
        name: String = "Fifth Dawn",
        type: String = "expansion",
        releaseDate: String = "2004-06-04",
        block: String? = nil,
        magicCardsInfoCode: String? = nil,
        mkmName: String? = nil,
        border: String? = nil,
        mkmID: Int? = nil
      ) -> Set {
        .init(code: code,
           name: name,
           type: type,
           releaseDate: releaseDate,
           block: block,
           magicCardsInfoCode: magicCardsInfoCode,
           mkmName: mkmName,
           border: border,
           mkmID: mkmID)
      }
      static func fakeExpansion2(
        code: String = "AER",
        name: String = "Aether Revolt",
        type: String = "expansion",
        releaseDate: String = "2017-01-20",
        block: String? = nil,
        magicCardsInfoCode: String? = nil,
        mkmName: String? = nil,
        border: String? = nil,
        mkmID: Int? = nil
      ) -> Set {
        .init(code: code,
           name: name,
           type: type,
           releaseDate: releaseDate,
           block: block,
           magicCardsInfoCode: magicCardsInfoCode,
           mkmName: mkmName,
           border: border,
           mkmID: mkmID)
      }
      static func fakeExpansion3(
        code: String = "AKH",
        name: String = "Amonkhet",
        type: String = "expansion",
        releaseDate: String = "2017-04-28",
        block: String? = nil,
        magicCardsInfoCode: String? = nil,
        mkmName: String? = nil,
        border: String? = nil,
        mkmID: Int? = nil
      ) -> Set {
        .init(code: code,
           name: name,
           type: type,
           releaseDate: releaseDate,
           block: block,
           magicCardsInfoCode: magicCardsInfoCode,
           mkmName: mkmName,
           border: border,
           mkmID: mkmID)
      }

}
