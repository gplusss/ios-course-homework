//: Playground - noun: a place where people can play

import UIKit

class AppDiary {
    
    var date: String
    var name: String
    var text: String
    var tag: String
    
    
    init(date: String, name: String, text: String, tag: String) {
        self.date = date
        self.name = name
        self.text = text
        self.tag = tag
    }
    func fullDEscrition() -> String {
        return "\(date)\n\(name)\n\(text)\n[\(tag)]\n"
    }

}


let first = AppDiary(date: "12 мая 2016 г.", name: "Завтрак", text: "Яичница", tag: "весело")
let second = AppDiary(date: "13 июня 2015 г.", name: "Обед", text: "Суп", tag: "грустно")

print(first.fullDEscrition())
print(second.fullDEscrition())

let array = [first, second]


 
