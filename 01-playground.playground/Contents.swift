//: Playground - noun: a place where people can play

import UIKit

class AppDiary {
    
    var date = Date()
    var name: String?
    var text: String?
    var tag: String?
    
    init(date: Date, name: String, text: String, tag: String) {
        self.date = date
        self.name = name
        self.text = text
        self.tag = tag
    }

    func fullDescrition() -> String {
    
        return "\(date)\n\(name)\n\(text)\n[\(tag)]\n"
    
    }
}

let first = AppDiary(date: Date(), name: "Завтрак", text: "Пью кофе, холодно и грустно, потому что осень", tag: "весело")
let second = AppDiary(date: Date(), name: "Обед", text: "Пью кофе, холодно и грустно, потому что осень", tag: "грустно")


print(first.fullDescrition())
print(second.fullDescrition())





