//
//  APIService.swift
//  EvaWeatherApp
//
//  Created by Ahmed Fathi on 23/07/2024.
//

import Foundation

class APIService {
    
    
    static let shared = APIService()
    
    
    func getWeatherData(forCity city: String,latitude: String, longitude: String,completion: @escaping (_ weather: WeatherModel?, _ error: Error?) -> Void ) {
        
        let urlString: String = "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&hourly=temperature_2m,rain,showers,snowfall,visibility,wind_speed_10m&timezone=Africa%2FCairo&start_date=2024-08-01&end_date=2024-08-01"
        guard let url = URL(string: urlString) else { return }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else { return }
            
            do {
                let result =  try JSONDecoder().decode(WeatherModel.self, from: data)
                print(result)
                completion(result, nil)
            } catch  {
                print(error.localizedDescription)
            }
            
            
            
        }
        task.resume()
    }
    
    
    
    @Published var cityWeathers: [CityWeather] = []
    
    init() {
        fetchWeatherData()
    }
    
    let cities = [
        ("Mansoura", "31.0364", "31.3807"),
        ("Tokyo", "35.6895", "139.6917"),
        ("Madrid", "40.4168", "-3.7038"),
        ("Lagos", "6.5244", "3.3792"),
        ("Moscow", "55.7558", "37.6176")
    ]
  private func fetchWeatherData()  {
        

        for city in cities {
            APIService.shared.getWeatherData(forCity: city.0, latitude: city.1 , longitude: city.2) { weather, error in
                if let weather = weather {
                    let cityWeather = CityWeather(name: city.0, latitude: city.1, longitude: city.2)
                    DispatchQueue.main.async {
                        self.cityWeathers.append(cityWeather)
                    }
                }
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
