//
//  MyWater.swift
//  water
//
//  Created by Кирилл Титов on 07.07.2024.
//

import UIKit

class MyWater: UIViewController {
    
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var waterConsumedLabel: UILabel!
    
    var totalWaterAmount: Double? {
        didSet {
            updateWaterUI()
        }
    }
    
    var consumedWaterAmount: Double = 0.0 {
        didSet {
            updateWaterUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWaterUI()
    }
    
    func updateWaterUI() {
        guard let totalWater = totalWaterAmount else {
            percentageLabel.text = "0.0%"
            waterConsumedLabel.text = "0.0 из 0.0 литров"
            return
        }
        let percentage = (consumedWaterAmount / totalWater) * 100
        percentageLabel.text = String(format: "%.1f%%", percentage)
        waterConsumedLabel.text = String(format: "%.1f из %.1f литров", consumedWaterAmount, totalWater)
    }
    
    @IBAction func addWater(_ sender: UIButton) {
        consumedWaterAmount += 0.2
    }
}


  


