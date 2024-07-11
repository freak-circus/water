//
//  WaterIntekeHistory.swift
//  water
//
//  Created by Богдан on 08.07.2024.
//

import Foundation

class WaterIntakeHistory {
    private var stack: [WaterIntakeDay] = []
    private var bestStreak: Int = 0
    
    //добавление записи в стек
    func addRecord(_ record: WaterIntakeDay) {
        stack.append(record)
    }
    
    //получение всех записей
    func getRecords() -> [WaterIntakeDay] {
        return stack
    }
    
    //получение текущего стрика
    func getCurrentStreak() -> Int {
        var currentStreak = 0
        for day in stack.reversed() {
            if day.isSuccess {
                currentStreak += 1
            } else {
                break
            }
        }
        return currentStreak
    }
    
    //получение лучшего стрика
    func getBestStreak() -> Int {
        var a = 0
        var bestStreak = 0
        for day in stack {
            if day.isSuccess {
                a += 1
                if a > bestStreak {
                    bestStreak = a
                }
            }
            else {
                a = 0
            }
        }
        return bestStreak
    }
}
