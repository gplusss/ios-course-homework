//
//  CellData.swift
//  02-storyboard
//
//  Created by Vladimir Saprykin on 19.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import UIKit

class Diary {
    var name: String?
    var date: Date
    
    init(name: String? = nil, date: Date) {
        self.name = name
        self.date = date
    }
    
    
    
}
let diaryData = [
    Diary(name: "Завтрак", date: Date()),
    Diary(name: "Обед", date: Date()),
    Diary(name: "Ланч", date: Date()),
    Diary(name: "Ужин", date: Date())
]
