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
            weatherTempMax.text = "34343434"
            //            weatherTempMin.text = String(describing: weather?.tempMin)
//            date.text = String(describing: weather?.date)
//            weatherStatus.text = weather?.status
//            weatherIcon.sd_setImage(with: URL(string: WeatherURL.weatherIcon + (weather?.icon)! + ".png"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    func load (wt: Weather) {
        weatherTempMax.text = String(describing: weather?.tempMax)
        weatherTempMin.text = String(describing: weather?.tempMin)
        date.text = String(describing: weather?.date)
        weatherStatus.text = wt.status	
        weatherIcon.sd_setImage(with: URL(string: WeatherURL.weatherIcon + (weather?.icon)! + ".png"))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
