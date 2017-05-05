//
//  ViewController.swift
//  Weather
//
//  Created by ThangLQ on 5/3/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currentTemMax: UILabel!
    @IBOutlet weak var currentTempMin: UILabel!
    @IBOutlet weak var currentTempStatus: UILabel!
    @IBOutlet weak var currentTempIcon: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    let cellId = "WeatherCellId"
    
    var weatherData = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(WeatherCell.self, forCellReuseIdentifier: cellId)
//        tableView.delegate = self
//        tableView.dataSource = self
        getCurrentWeatherData()
        getForeCastWeatherData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! WeatherCell
        let weather = weatherData[indexPath.row]
        cell.weather = weather
        return cell
    }
    
    func getCurrentWeatherData() {
        let url = WeatherURL.currentWeatherURL + WeatherURL.latitude + "21.027668&" + WeatherURL.longtitude + "105.820869&appid=" + WeatherURL.appId
        print("url ==> \(url)")
        Alamofire.request(url, method: .get).responseJSON { reponse in
            if let json = reponse.result.value {
//                print("json==>\(json)")
                if let dictionary = json as? [String: AnyObject] {
                    
                    //weather status
                    if let weather = dictionary["weather"] as? [Any] {
                        if let firstItem = weather.first as? [String: AnyObject] {
                            if let main = firstItem["main"] as? String {
                                self.currentTempStatus.text = main
                            }
                            
                            if let icon = firstItem["icon"] as? String {
                                self.currentTempIcon.sd_setImage(with: URL(string: WeatherURL.weatherIcon + icon + ".png"))
                            }
                        }
                    }
                    
                    // main include min max
                    if let main = dictionary["main"] as? [String: AnyObject] {
                        if let temMin = main["temp_min"] as? Double {
                            let minTemp = (Int)(temMin - 273.15)
                            self.currentTempMin.text = "\(minTemp)" + WeatherURL.weatherUnit
                        }
                        if let temMax = main["temp_max"] as? Double {
                            let maxTemp = (Int)(temMax - 273.15)
                            self.currentTemMax.text = "\(maxTemp)" + WeatherURL.weatherUnit
                        }
                    }
                }
            }
        }
    }
    
    func getForeCastWeatherData() {
        let url = WeatherURL.forecastWeatherURL + WeatherURL.latitude + "21.027668&" + WeatherURL.longtitude + "105.820869&cnt=7&appid=" + WeatherURL.appId
        print("url ==> \(url)")

        Alamofire.request(url, method: .get).responseJSON { response in
            if let json = response.result.value {
                print("json ==>\(json)")
                if let dictionary = json as? [String: AnyObject] {
                    if let listObject = dictionary["list"] as? NSArray {
                        for eachItem in listObject {
                            let data = eachItem as? [String: AnyObject]
                            let date = data?["dt"] as? Int
                            var minTemp = 0
                            var maxTemp = 0

                            if let main = data?["temp"] as? [String: AnyObject] {
                                if let tempMin = main["min"] as? Double {
                                    minTemp = (Int)(tempMin - 273.15)
                                }
                                
                                if let tempMax = main["max"] as? Double {
                                    maxTemp = (Int)(tempMax - 273.15)
                                }
                            }
                            
                            var icon = ""
                            var status = ""
                            if let weatherArray = data?["weather"] as? [Any] {
                                if let firstItem = weatherArray.first as? [String: AnyObject] {
                                    icon = (firstItem["icon"] as? String)!
                                    status = (firstItem["main"] as? String)!
                                }
                            }

                            
                            let weather = Weather(icon: icon, date: date!, status: status, tempMax: maxTemp, tempMin: minTemp)
                            
                            self.weatherData.append(weather)
                        }

                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                }
            }
        }
    }
}

