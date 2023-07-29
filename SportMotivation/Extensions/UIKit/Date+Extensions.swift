//
//  Date+Extensions.swift
//  FirstApp05.04
//
//  Created by Alexandr on 28.04.2022.
//

import UIKit
import Network

extension Date {
    
    func localDate() -> Date {
        let timezoneOffset = Double(TimeZone.current.secondsFromGMT(for: self))
        let localDatte = Calendar.current.date(byAdding: .second, value: Int(timezoneOffset), to: self) ?? Date()
        
        return localDatte
    }
    
    func getWeekArray() -> [[String]] {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_GB") // For show on display in English. Mo, Tu, We
        formatter.dateFormat = "EEEEEE"
        
        
        var weekArray: [[String]] = [[], []]
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "UTC") ?? .current
        
        for index in -6 ... 0 {
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            let numberDay = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            // Day representation as a int number
            let day = calendar.component(.day, from: numberDay)
            weekArray[1].append("\(day)")
            // Day representation as a short weekday name
            let weekDay = formatter.string(from: date)
            weekArray[0].append(weekDay)
        }
        
        return weekArray
    }
    
    func getWeekDayNumber() -> Int {
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: self)
        
        return weekDay
    }
    
}
