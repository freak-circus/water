//
//  WaterIntakeDay.swift
//  water
//
//  Created by Богдан on 08.07.2024.
//

import Foundation

struct WaterIntakeDay {
    let date: Date
    let amount: Double //количество выпитой воды
    let target: Double //цель на день
    
    var isSuccess: Bool {
        return amount >= target //достигнута ли цель
    }
}
