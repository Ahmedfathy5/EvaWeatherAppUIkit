//
//  TempretureViewController.swift
//  EvaWeatherApp
//
//  Created by Ahmed Fathi on 23/07/2024.
//

import UIKit

class TempretureViewController: UIViewController {
    
    @IBOutlet weak var tempText: UILabel!
    
    var country: CityWeather?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let country = country {
            title = country.name
            APIService.shared.getWeatherData(forCity: country.name, latitude: country.latitude, longitude: country.longitude) { weather, error in
                DispatchQueue.main.async {
                    let tempreture = weather?.hourly.temperature_2m[0]
                    self.tempText.text = "The tempreture of \(country.name) is \(String(describing: tempreture))"
                }
            }
            
        }
    }
}
