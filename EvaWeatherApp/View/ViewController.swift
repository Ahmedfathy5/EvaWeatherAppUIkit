//
//  ViewController.swift
//  EvaWeatherApp
//
//  Created by Ahmed Fathi on 21/07/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherTableView: UITableView!
    
    let cities = [
        CityWeather(name: "Mansoura", latitude: "31.0364", longitude: "31.3807"),
        CityWeather(name: "Madrid", latitude: "40.4168", longitude: "3.7038"),
        CityWeather(name: "Lagos", latitude: "6.5244", longitude: "3.3792"),
        CityWeather(name: "Moscow", latitude: "55.7558", longitude: "37.6176")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    
    func setUp() {
        title = "Eva Pharma"
        weatherTableView.dataSource = self
        weatherTableView.delegate = self
        weatherTableView.register(UINib(nibName: "WeatherCell", bundle: nil), forCellReuseIdentifier: "WeatherCell")
        
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = weatherTableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell
        else { return UITableViewCell() }
        cell.countryName.text = cities[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = cities[indexPath.row]
        let temperatureVC = TempretureViewController()
        temperatureVC.country = selectedCountry
        self.navigationController?.pushViewController(TempretureViewController(), animated: true)
        
    }
    
}
