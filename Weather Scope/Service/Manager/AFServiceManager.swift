//
//  AFServiceManager.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 27.12.2023.
//

import Foundation
import Alamofire

final class AFServiceManager {
    
    static let shared = AFServiceManager()
    
    private init() { }
    
    func fetchRequest<T: Decodable>(urlString: String,parameters:[String: Any]?, completion: @escaping(Result<T, AFError>) ->()) {
       
        guard let url = URL(string: urlString) else {
            completion(.failure(AFError.invalidURL(url: urlString)))
            return
        }
        
        AF.request(url, parameters: parameters,encoding: JSONEncoding.default).validate().responseDecodable(of:T.self) { response in
            switch response.result {
            case .success(let success):
                completion(.success(success))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
        
    }
}
