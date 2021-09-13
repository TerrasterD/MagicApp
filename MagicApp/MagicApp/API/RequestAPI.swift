//
//  RequestAPI.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 27/04/21.
//

import UIKit

protocol RequestAPIProtocol {

    func request<T: Decodable>(typeRequest: TypeRequest,
                               typeResponse: T.Type,
                               completion: @escaping(Result<T, Error>) -> Void)

}

final class RequestAPI: RequestAPIProtocol {

    // MARK: - Atributes
    private let session: URLSession

    // MARK: - Initializers

    init(session: URLSession = URLSession.shared) {

        self.session = session

    }

    // MARK: - Methods

    public func request<T>(typeRequest: TypeRequest,
                           typeResponse: T.Type,
                           completion: @escaping (Result<T, Error>) -> Void)
    where T: Decodable {
        guard let url = URL(string: typeRequest.path) else {
            completion(.failure(APIError.badUrl))
            return
        }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)

        components?.queryItems = typeRequest.parameters?.map {key, value in

            URLQueryItem(name: key, value: value)

        }

        var request = URLRequest(url: url)

        request.httpMethod = typeRequest.method
        request.allHTTPHeaderFields = typeRequest.header

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(APIError.generic(error)))
            }
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(APIError.generic(nil)))
                return
            }
            guard let data = data else {
                completion(.failure(APIError.nullData))
                return
            }
            switch response.statusCode {
            case 100...199:
                completion(.failure(APIError.informativeResponse))
            case 200...299:
                completion(self.decode(data: data, typeResponse: typeResponse))
            case 300...399:
                completion(.failure(APIError.redirect))
            case 400...499:
                completion(.failure(APIError.client))
            case 500...599:
                completion(.failure(APIError.server))
            default:
                completion(.failure(APIError.generic(nil)))
            }
        }
        task.resume()
    }

    private func decode<T: Decodable>(data: Data, typeResponse: T.Type) -> Result<T, Error> {

        do {
            let object = try JSONDecoder().decode(typeResponse, from: data)
            return .success(object)
        } catch {
            return .failure(APIError.decode(error))
        }

    }

}

enum APIError: Error {
    case badUrl
    case generic(Error?)
    case nullData
    case informativeResponse
    case redirect
    case client
    case server
    case decode(Error)

}
