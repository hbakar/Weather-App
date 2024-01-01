//
//  HomeViewController.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 27.12.2023.
//

import UIKit
import CoreLocation
import Kingfisher

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        let lat: String = String(viewModel?.lat ?? 40.19730506199397)
        let lon: String = String(viewModel?.lon ?? 29.057647102306348)
        viewModel?.fetchWeather(with: WeatherAPIEndpoint.weather(lat: lat, long:lon))
        
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
    func notify(_ event: HomeViewModelEvents) {
        switch event {
        case .didFetchWeather:
            DispatchQueue.main.async {
                guard let weather = self.viewModel?.weatherResponse else { return }
                guard let weatherLike = weather.weather else { return }
                if let first = weatherLike.first {
                    guard let url = URL(string: "http://openweathermap.org/img/w/\(first.icon ?? "").png") else { return }
                    
                    self.weatherImage.kf.setImage(with: url)
                    self.titleLabel.text = weather.name ?? ""
                    self.humidityLabel.text = String("Humidity: \(weather.main?.humidity ?? 0)")
                    self.tempLabel.text = String("Temp: \(weather.main?.temp ?? 0)")
                    self.descLabel.text = first.description ?? ""
                }
            }
        case .fetchFailed(let error):
            print(error.localizedDescription)
        }
    }
}



extension HomeViewController: CLLocationManagerDelegate {
    
}
