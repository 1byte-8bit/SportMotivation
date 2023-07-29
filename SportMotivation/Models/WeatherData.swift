//
//  WeatherData.swift
//  FirstApp05.04
//
//  Created by Alexandr on 12.09.2022.
//

import UIKit

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
    let description: String
}
