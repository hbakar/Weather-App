//
//  WeatherModel.swift
//  Weather Scope
//
//  Created by Hüseyin BAKAR on 28.12.2023.
//

import Foundation

struct WeatherResponse: Decodable {
    let coord: CoordResponseResult?
    let weather: [WeatherResponseResult]?
    let base: String?
    let main: MainResponseResult?
    let visibility: Int?
    let wind: WindResponseResult?
    let clouds: CloudsResponseResult?
    let dt: Int?
    let sys: SysResponseResult?
    let timezone: Int?
    let id: Int?
    let name: String?
    let cod: Int?
}

struct CoordResponseResult: Decodable {
    let lat: Double?
    let lon: Double?
}

struct WeatherResponseResult: Decodable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct MainResponseResult: Decodable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Int?
    let humidity: Int?
    let sea_level: Int?
    let grnd_level: Int?
}

struct WindResponseResult: Decodable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct CloudsResponseResult: Decodable {
    let all: Int?
}

struct SysResponseResult: Decodable {
    let type: Int?
    let id: Int?
    let country: String?
    let sunrise: Int?
    let sunset: Int?
}
