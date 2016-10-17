//: Playground - noun: a place where people can play

import UIKit

class AppDiary {
    
    var date = Date()
    var name: String
    var text: String
    var tags: [String]
    
    init(date: Date, name: String, text: String, tags: [String]) {
        self.date = date
        self.name = name
        self.text = text
        self.tags = tags
    }

    func fullDescrition() -> String {
        var result = date.description

        if (name.isEmpty) {
            result += "\n" + name
        }
        
        if (tags.count) > 0 {
            result += "\n"
            for i in tags {
                result += "[" + i + "]"
            }
        }
        if (text.isEmpty) {
            result += "\n" + text
        }
    
        //return result
        return String(describing: date) + "\n" + name + "\n" + text + "\n" + String(describing: tags)
    }
    
}

let first = AppDiary(date: Date(), name: "Завтрак", text: "Пью кофе, холодно и грустно, потому что не сразу получилось", tags: ["весело",  "грустно"])
let second = AppDiary(date: Date(), name: "Обед", text: "Пью кофе, весело и радостно, потому что Swift", tags: ["грустно"])
let third = AppDiary(date: Date(), name: "Ужин", text: "Ем сочный стейк, потому что всё сделал", tags: ["круто", "вечер"])

//print(first.fullDescrition())
//print(second.fullDescrition())
//print(third.fullDescrition())

let arrayDiary = [first, second, third]




