//
//  HomeDataProvider.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 28.12.2023.
//


final class HomeDataProvider: HomeDataProviderProtocol {
    
    func fetchWeather(with endpoint: Endpoint, completion: @escaping (Result<WeatherResponse, Error>) -> ()) {
        ServiceManager.shared.fetchRequest(with: endpoint, completion: completion)
    }
    
}
