//
//  WeatherManager.swift
//  WeatherProject
//
//  Created by Trí Nguyễn on 13/12/2021.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    func getCurrentWeather(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) async throws -> ResponseBody { // Swift 5.5
        // check url
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&appid=\("d1fb45c088940c792b747631e0dddbf8")&units=metric") else { fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let decodeData = try JSONDecoder().decode(ResponseBody.self, from: data)
        return decodeData
    }
}
