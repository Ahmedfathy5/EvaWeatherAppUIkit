//
//  WeatherCell.swift
//  EvaWeatherApp
//
//  Created by Ahmed Fathi on 23/07/2024.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var favoriteBtn: UIButton!
    
    @IBAction func btnPressed(_ sender: UIButton) {
        favoriteBtn.isEnabled = true
        favoriteBtn.tintColor = .red
    }
    
}
