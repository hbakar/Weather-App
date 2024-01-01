//
//  ServiceManager.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 28.12.2023.
//

import Foundation

final class ServiceManager {
   
    static let shared = ServiceManager()
    
    private init() { }
    
    func fetchRequest<T: Decodable>(with endpoint: Endpoint, completion: @escaping(Result<T, Error>) ->()) {
      
        guard let request = endpoint.generateURLRequest() else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                } 
                catch {
                    completion(.failure(error))
                    return
                }
            }
            else {
                completion(.failure(NSError(domain: "No data returned", code: 0)))
                return
            }
        }
        task.resume()
    }
}
