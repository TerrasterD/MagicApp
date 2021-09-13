//
//  TypeRequest.swift
//  MagicApp
//
//  Created by victor.d.ciccarini on 28/04/21.
//

import Foundation

protocol TypeRequest {

    var basePath: String {get}
    var path: String {get}
    var method: String {get}
    var header: [String: String]? {get}
    var parameters: [String: String]? {get}

}
