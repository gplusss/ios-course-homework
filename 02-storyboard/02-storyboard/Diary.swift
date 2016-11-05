//
//  Diary.swift
//  Diary
//
//  Created by Vladimir Saprykin on 22.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import RealmSwift

class Diary: Object {
    enum Weather: String {
        case rain, shower, storm
    }
    
    dynamic var id = UUID().uuidString
    dynamic var name: String?
    dynamic var direction: Date?
    fileprivate dynamic var weatherRaw = Weather.rain.rawValue
    var weather: Weather {
        set { self.weatherRaw = newValue.rawValue }
        get { return Weather(rawValue: weatherRaw)! }
    }
    
    convenience init(name: String? = nil, direction: Date? = nil) {
        self.init()
        self.name = name
        self.direction = direction
    }
    
    func formatDate() -> String {
        let format = DateFormatter()
        format.dateFormat = UserDefaults.standard.string(forKey: kDateFormat)
        if let direction = direction {
            return format.string(from: direction)
        }
        return ""
    }
    
    override class func primaryKey() -> String? { return "id" }
}

