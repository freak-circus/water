//
//  MyWater.swift
//  water
//
//  Created by Кирилл Титов on 07.07.2024.
//

import UIKit

class MyWater: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var waterConsumedLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var pickerContainerView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
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
    
    let beverageTypes = ["Вода", "Чай", "Кофе"]
    let beverageVolumes = [20.0, 50.0, 100.0, 150.0, 200.0, 250.0, 300.0, 350.0, 400.0, 450.0, 500.0, 1000.0, 2500.0]
    var selectedBeverageType: String = "Вода"
    var selectedBeverageVolume: Double = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            if let savedUserData = UserDefaults.standard.data(forKey: "user"),
               let savedUser = try? JSONDecoder().decode(User.self, from: savedUserData) {
                totalWaterAmount = savedUser.total / 1000
            } else {
                print("No user found for the key")
            }
        } catch {
            print("failed")
        }
        updateWaterUI()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerContainerView.isHidden = true
        
        progressView.setProgress(0.0, animated: false)
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
    
    func updateProgressView() {
        guard let totalWater = totalWaterAmount else {
            progressView.setProgress(0.0, animated: true)
            return
        }
        let progress = Float(consumedWaterAmount / totalWater)
        progressView.setProgress(progress, animated: true)
    }
    
    @IBAction func addWater(_ sender: UIButton) {
        showPickerAlert()
    }
    
    func showPickerAlert() {
        let alert = UIAlertController(title: "Выберите тип напитка и объем", message: "\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 50, width: alert.view.bounds.width - 20, height: 140))
        pickerView.dataSource = self
        pickerView.delegate = self
        
        alert.view.addSubview(pickerView)
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            self.consumedWaterAmount += self.selectedBeverageVolume / 1000.0 // converting ml to liters
            self.updateProgressView()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func donePickerSelection(_ sender: UIButton) {
        consumedWaterAmount += selectedBeverageVolume / 1000.0 // converting ml to liters
        pickerContainerView.isHidden = true
    }
    
    // MARK: - UIPickerView DataSource and Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return component == 0 ? beverageTypes.count : beverageVolumes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return component == 0 ? beverageTypes[row] : "\(beverageVolumes[row]) мл"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            selectedBeverageType = beverageTypes[row]
        } else {
            selectedBeverageVolume = beverageVolumes[row]
        }
    }
}

  


