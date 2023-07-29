//
//  LocationManager.swift
//  FirstApp05.04
//
//  Created by Alexandr on 12.09.2022.
//

import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
    func toDisplay(_ weather: WeatherModel)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?"
    
    func fetchData(lat: Double, lon: Double) {
        
        var apiKey: String {
            get {
                guard let filePath = Bundle.main.path(forResource: "api", ofType: "plist") else {
                    fatalError("Couldn't find file 'api.plist'.")
                }
                let plist = NSDictionary(contentsOfFile: filePath)
                guard let value = plist?.object(forKey: "API_KEY") as? String else {
                      fatalError("Couldn't find key 'API_KEY' in 'api.plist'.")
                    }
                
                return value
            }
        }
        
        let urlString = "\(weatherURL)lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"
        
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            print(url)
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        delegate?.toDisplay(weather)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            
            let name = decodeData.name
            let temp = decodeData.main.temp
//            let description = decodeData.weather[0].description
            let id = decodeData.weather[0].id
            
            let weather = WeatherModel(conditionId: id, temperature: temp, cityName: name)
            
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
}
