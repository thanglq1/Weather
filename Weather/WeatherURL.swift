//
//  WeatherURL.swift
//  Weather
//
//  Created by ThangLQ on 5/3/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class WeatherURL {
    static let basicUrl = "http://api.openweathermap.org/"
    static let appId = "51f9ee6c701ad6e6f343996dd499f11f"
    static let latitude = "lat="
    static let longtitude = "lon="
    static let currentWeatherURL = "\(basicUrl)data/2.5/weather?"
    static let weatherUnit = "°C"
    static let weatherIcon = "http://openweathermap.org/img/w/"
    static let forecastWeatherURL = "\(basicUrl)data/2.5/forecast/daily?"
}
