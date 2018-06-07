//
//  Logger.swift
//  TankLand
//
//  Created by Nicholas Hatzis-Schoch on 5/11/18.
//  Copyright © 2018 Slick Games. All rights reserved.
//

import Foundation

func getTime()->String{
    let date = Date()
    let calendar = Calendar.current
    let components = calendar.dateComponents([.hour, .minute, .second], from: date)
    let hour = components.hour
    let minute = components.minute
    let second = components.second
    return "\(hour):\(minute):\(second)"
}

struct Logger{
    var majorLoggers: [GameObject]
    var turn: Int
    init(){
        majorLoggers = []
        turn = 0
    }
    mutating func log(_ message: String){
        print(message)
    }
    mutating func addMajorLogger(gameObject: GameObject, message: String){
        majorLoggers.append(gameObject)
        addLog(gameObject: gameObject, message: "\(gameObject.id): \(message)")
    }
    mutating func addLog(gameObject: GameObject, message: String){
        if majorLoggers.contains(where: {$0 === gameObject}) {
            log("\(turn) \(getTime()) \(gameObject.id) \(gameObject.position) \(message)")
        }
        else {
        log("\(turn) \(getTime()) \(gameObject.id) does not have permission to log!")
        }
    }
}
