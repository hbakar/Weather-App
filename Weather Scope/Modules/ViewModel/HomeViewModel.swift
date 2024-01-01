//
//  HomeViewModel.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 28.12.2023.
//

import Alamofire
import CoreLocation

final class HomeViewModel: HomeViewModelProtocol {
   
    var lat: Double?
    
    var lon: Double?
    
    var locationManager: CLLocationManager?
    
    weak var delegate: HomeViewModelDelegate?
    
    var weatherResponse: WeatherResponse?
    
    private let service: HomeDataProviderProtocol
    
    init(service: HomeDataProviderProtocol) {
        self.service = service
    }
    
    func fetchWeather(with endpoint: Endpoint) {
        service.fetchWeather(with: endpoint) { [weak self] response in
            switch response {
            case .success(let success):
                self?.weatherResponse = success
                self?.delegate?.notify(.didFetchWeather)
            case .failure(let failure):
                self?.delegate?.notify(.fetchFailed(failure))
            }
        }
    }
}
