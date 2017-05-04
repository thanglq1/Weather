//
//  Weather.swift
//  Weather
//
//  Created by ThangLQ on 5/3/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class Weather {
    var icon: String?
    var date: Int?
    var status: String?
    var tempMax: Int?
    var tempMin: Int?
    
    init(icon: String, date: Int, status: String, tempMax: Int, tempMin: Int) {
        self.icon = icon
        self.date = date
        self.status = status
        self.tempMax = tempMax
        self.tempMin = tempMin
    }
}
