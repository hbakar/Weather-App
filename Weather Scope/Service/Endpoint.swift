//
//  Endpoint.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 27.12.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var method: String { get }
    func generateURLRequest() -> URLRequest?
    func generateURLString() -> String?
}
