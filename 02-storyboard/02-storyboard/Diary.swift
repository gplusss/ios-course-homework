//
//  Diary.swift
//  Diary
//
//  Created by Vladimir Saprykin on 22.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import CoreData

class Diary: Equatable {
    var name: String?
    var direction: Date?
    
    init(name: String? = nil, direction: Date? = nil) {
        self.name = name
        self.direction = direction
    }
    
    static func ==(lhs: Diary, rhs: Diary) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
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
