//
//  Diary.swift
//  02-storyboard
//
//  Created by Vladimir Saprykin on 22.10.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation

class Diary {
    var name: String?
    var direction: String?
    
    init(name: String? = nil, direction: String? = nil) {
        self.name = name
        self.direction = direction
    }
}
