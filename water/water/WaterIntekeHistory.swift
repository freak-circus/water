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
                if currentStreak > bestStreak {
                    bestStreak = currentStreak //получение лучшего стрика
                }
            } else {
                break
            }
        }
        return currentStreak
    }
}
