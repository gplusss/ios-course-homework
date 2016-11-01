//
//  Diary.swift
//  Diary
//
//  Created by Vladimir Saprykin on 22.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import RealmSwift

class Diary: Object/*, Equatable*/ {
    dynamic var name: String?
    dynamic var direction: Date?
    
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
}

