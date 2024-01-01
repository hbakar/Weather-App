//
//  HomeViewModelProtocol.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 28.12.2023.
//

import Alamofire
import CoreLocation

protocol HomeViewModelProtocol {
    
    var delegate: HomeViewModelDelegate? { get set }
    
    var weatherResponse: WeatherResponse? {get set}
    
    func fetchWeather(with endpoint: Endpoint)
    
    var locationManager: CLLocationManager? {get set}
    
    var lat: Double? {get set}
    
    var lon: Double? {get set}
}

protocol HomeViewModelDelegate: AnyObject {
    func notify(_ event: HomeViewModelEvents)
}

enum HomeViewModelEvents {
    case didFetchWeather
    case fetchFailed(Error)
}

