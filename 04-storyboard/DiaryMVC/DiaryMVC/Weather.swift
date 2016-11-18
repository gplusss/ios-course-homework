//
//  Weather.swift
//  DiaryMVC
//
//  Created by Vladimir Saprykin on 14.11.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

class UIViewUtils {
    
    
    enum Weather: Int {
        case sun = 1, cloud, rain, storm, snow
        
    }
    
    static func weatherImage(weather: Weather) -> UIImage?{
        switch weather {
        case .sun:
            return UIImage(named: "weather_sun")
        case .cloud:
            return UIImage(named: "weather_cloud")
        case .rain:
            return UIImage(named: "weather_rain")
        case .storm:
            return UIImage(named: "weather_storm")
        case .snow:
            return UIImage(named: "weather_snow")
        }
    }
    
    static func shortDateString(date: NSDate?) -> String?{
        if let date = date{
            let calendar = Calendar.current
            
            var month = calendar.shortMonthSymbols[calendar.component(.month, from: date as Date) - 1]
            month = month.uppercased()
            
            var day = String(calendar.component(.day, from: date as Date))
            day = day.characters.count == 1 ? "0\(day)" : day
            
            return "\(month) \(day)"
        }
        else{
            return nil
        }
    }
    
    static func isDayOfDate(_ date1: Date, equalTo date2: Date) -> Bool{
        return Calendar.current.isDate(date1, equalTo: date2, toGranularity: .day)
    }
    
    static func weatherColor(weather: Weather) -> UIColor{
        switch weather {
        case .sun:
            return UIColor.orange
        case .cloud:
            return UIColor.cyan
        case .rain:
            return UIColor.magenta
        case .storm:
            return UIColor.brown
        case .snow:
            return UIColor.blue
        }
    }
}

