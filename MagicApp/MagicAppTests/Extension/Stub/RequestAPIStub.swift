//
//  RequestAPIStub.swift
//  MagicAppTests
//
//  Created by victor.d.ciccarini on 05/05/21.
//

import XCTest
@testable import MagicApp

class RequestAPIStub: RequestAPIProtocol {

    var jsonMock: String

    init(jsonMock: String) {
        self.jsonMock = jsonMock
    }

    func request<T>(typeRequest: TypeRequest,
                    typeResponse: T.Type,
                    completion: @escaping (Result<T, Error>) -> Void)
    where T: Decodable {
        let data = JSONHelper.getDataFrom(json: jsonMock)
        do {
            let object = try JSONDecoder().decode(typeResponse, from: data!)
            completion(.success(object))
        } catch {
            fatalError("Could not find JSON file")
        }
    }

}
