//
//  HomeDataProviderProtocol.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 28.12.2023.
//


protocol HomeDataProviderProtocol {
    func fetchWeather(with endpoint: Endpoint,completion: @escaping(Result<WeatherResponse, Error>) ->())
}
