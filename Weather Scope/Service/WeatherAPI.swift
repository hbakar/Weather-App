//
//  WeatherAPI.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 27.12.2023.
//

import Foundation

enum WeatherAPIEndpoint {
    
    case weather(lat: String,long: String?)
}

extension WeatherAPIEndpoint: Endpoint {
    
    var scheme: String {
        return Constants.scheme
    }
    
    var baseURL: String {
        return Constants.baseURL
    }
    
    var path: String {
        switch self {
        case .weather:
            return Constants.path
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .weather(lat: let lat,long: let long):
            return [URLQueryItem(name: "lat", value: lat),URLQueryItem(name: "lon", value: long),URLQueryItem(name: "apiKey", value: Constants.apiKey)]
        }
    }
    
    var method: String {
        return "get"
    }
    
    func generateURLRequest() -> URLRequest? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = baseURL
        urlComponents.path = path
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
    
    func generateURLString() -> String? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = queryItems
        
        return components.url?.absoluteString
    }
    
}
