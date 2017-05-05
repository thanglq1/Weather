//
//  DateUtils.swift
//  Weather
//
//  Created by ThangLQ on 5/4/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class DateUtils {
    static func converTimeStampToDate(timeStamp: Int) -> String {
        var dateResult = ""
        let date = NSDate(timeIntervalSince1970: TimeInterval(timeStamp))
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        dateResult = dateFormater.string(from: date as Date)
        return dateResult
    }
    
    static func getDayOfWeekInt(timeStamp: Int) -> Int? {
        let date = converTimeStampToDate(timeStamp: timeStamp)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        guard let today = dateFormater.date(from: date) else {return nil}
        let calendar = Calendar(identifier: .gregorian)
        let weekDay = calendar.component(.weekday, from: today)
        return weekDay
    }
    
    static func getDayOfWeek(day: Int) -> String {
        let dayOfWeek = getDayOfWeekInt(timeStamp: day)!
        var dayString = ""
        switch dayOfWeek {
        case 1:
            dayString = "Sunday"
        case 2:
            dayString = "Monday"
        case 3:
            dayString = "Tuesday"
        case 4:
            dayString = "Wesday"
        case 5:
            dayString = "Thurday"
        case 6:
            dayString = "Friday"
        case 7:
            dayString = "Saturday"
        default:
            dayString = ""
        }
        
        return dayString
    }
}
