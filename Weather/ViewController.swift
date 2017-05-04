//
//  ViewController.swift
//  Weather
//
//  Created by ThangLQ on 5/3/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currentTemMax: UILabel!
    @IBOutlet weak var currentTempMin: UILabel!
    @IBOutlet weak var currentTempStatus: UILabel!
    @IBOutlet weak var currentTempIcon: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    var weatherData = [Weather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell
        let weather = weatherData[indexPath.row]
        cell?.weather = weather
        return cell!
    }
}

