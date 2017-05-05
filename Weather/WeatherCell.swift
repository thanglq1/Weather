//
//  WeatherCell.swift
//  Weather
//
//  Created by ThangLQ on 5/3/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit
import SDWebImage

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherTempMax: UILabel!
    @IBOutlet weak var weatherTempMin: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var weatherStatus: UILabel!
    
    var weather: Weather? {
        didSet {
            if let max = weather?.tempMax {
                weatherTempMax.text = String(describing: max) + WeatherURL.weatherUnit
            }
            if let min = weather?.tempMin {
                weatherTempMin.text = String(describing: min) + WeatherURL.weatherUnit
            }
            
            date.text = String(describing: DateUtils.getDayOfWeek(day: (weather?.date)!))
            weatherStatus.text = weather?.status
            weatherIcon.sd_setImage(with: URL(string: WeatherURL.weatherIcon + (weather?.icon)! + ".png"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
