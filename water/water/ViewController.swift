//
//  ViewController.swift
//  water
//
//  Created by Кирилл Титов on 07.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //
    //    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    //
    //    @IBOutlet weak var weightTextField: UITextField!
    //
    //    @IBOutlet weak var heightTextField: UITextField!
    //
    //    @IBOutlet weak var ageTextField: UITextField!
    //
    //    @IBOutlet weak var nameTextField: UITextField!
    //
    //    @IBOutlet weak var workoutFrequencySegmentedControl: UISegmentedControl!
    //
    //    @IBOutlet weak var weatherSegmentedControl: UISegmentedControl!
    //
    //    @IBOutlet weak var sweetDrinksSegmentedControl: UISegmentedControl!
    //
    //    @IBOutlet weak var coffeeEnergyDrinksSegmentedControl: UISegmentedControl!
    //
    //    @IBOutlet weak var vegetablesFruitsSegmentedControl: UISegmentedControl!
    //
    //    @IBOutlet weak var goalsStackView: UIStackView!
    //    @IBOutlet weak var fullScreenImage: UIImageView!
    //
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //
    //        // Показываем полноэкранное изображение
    //        fullScreenImage.isHidden = false
    //
    //        // Настраиваем таймер для скрытия изображения и настройки UI
    //        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [weak self] _ in
    //            self?.fullScreenImage.isHidden = true
    //            self?.setupUI()
    //        }
    //    }
    //
    //    // MARK: - Properties
    //    var selectedGoals: [String] = []
    //
    //
    //    // MARK: - UI Setup
    //    func setupUI() {
    //        setupSegmentedControls()
    //        setupTextFields()
    //        setupGoalsCheckboxes()
    //    }
    //
    //    func setupSegmentedControls() {
    //        genderSegmentedControl.removeAllSegments()
    //        genderSegmentedControl.insertSegment(withTitle: "Мужской", at: 0, animated: false)
    //        genderSegmentedControl.insertSegment(withTitle: "Женский", at: 1, animated: false)
    //        genderSegmentedControl.selectedSegmentIndex = 0
    //
    //        setupSegmentedControl(workoutFrequencySegmentedControl, withTitles: ["Редко", "Регулярно", "Часто"])
    //        setupSegmentedControl(weatherSegmentedControl, withTitles: ["Холодно", "Нормально", "Жарко"])
    //        setupSegmentedControl(sweetDrinksSegmentedControl, withTitles: ["Почти никогда", "Редко", "Регулярно", "Часто"])
    //        setupSegmentedControl(coffeeEnergyDrinksSegmentedControl, withTitles: ["Почти никогда", "Редко", "Регулярно", "Часто"])
    //        setupSegmentedControl(vegetablesFruitsSegmentedControl, withTitles: ["Редко", "Регулярно", "Часто"])
    //    }
    //
    //    func setupSegmentedControl(_ control: UISegmentedControl, withTitles titles: [String]) {
    //        control.removeAllSegments()
    //        for (index, title) in titles.enumerated() {
    //            control.insertSegment(withTitle: title, at: index, animated: false)
    //        }
    //        control.selectedSegmentIndex = 0
    //    }
    //
    //    func setupTextFields() {
    //        weightTextField.keyboardType = .decimalPad
    //        heightTextField.keyboardType = .numberPad
    //        ageTextField.keyboardType = .numberPad
    //    }
    //
    //    func setupGoalsCheckboxes() {
    //        let goals = ["Пить больше воды", "Снизить вес", "Улучшить состояние кожи", "Вести здоровый образ жизни", "Улучшить пищеварение"]
    //        for goal in goals {
    //            let checkbox = UIButton(type: .system)
    //            checkbox.setTitle(goal, for: .normal)
    //            checkbox.addTarget(self, action: #selector(goalCheckboxTapped(_:)), for: .touchUpInside)
    //            goalsStackView.addArrangedSubview(checkbox)
    //        }
    //    }
    //
    //    @objc func goalCheckboxTapped(_ sender: UIButton) {
    //        sender.isSelected = !sender.isSelected
    //        if sender.isSelected {
    //            selectedGoals.append(sender.titleLabel?.text ?? "")
    //        } else {
    //            selectedGoals.removeAll { $0 == sender.titleLabel?.text }
    //        }
    //    }
    //
    //    // MARK: - Helper Methods
    //    func validateInputs() -> Bool {
    //        // Проверка заполнения всех полей
    //        // Возвращает false и показывает alert, если что-то не заполнено
    //        return true // Замените на реальную логику валидации
    //    }
    //
    //    func calculateWaterAmount() -> Double {
    //        // Базовое количество воды
    //        var waterAmount = 30.0 * (Double(weightTextField.text ?? "0") ?? 0)
    //
    //        // Учет факторов
    //        if workoutFrequencySegmentedControl.selectedSegmentIndex > 0 {
    //            waterAmount += 300 // Дополнительно при регулярных тренировках
    //        }
    //
    //        if weatherSegmentedControl.selectedSegmentIndex == 2 {
    //            waterAmount += 500 // Дополнительно в жаркую погоду
    //        }
    //
    //        if sweetDrinksSegmentedControl.selectedSegmentIndex > 1 {
    //            waterAmount += 200 // Дополнительно при частом употреблении сладких напитков
    //        }
    //
    //        if coffeeEnergyDrinksSegmentedControl.selectedSegmentIndex > 1 {
    //            waterAmount += 200 // Дополнительно при частом употреблении кофе и энергетиков
    //        }
    //
    //        if vegetablesFruitsSegmentedControl.selectedSegmentIndex < 1 {
    //            waterAmount += 200 // Дополнительно при редком употреблении овощей и фруктов
    //        }
    //
    //        // Учет целей
    //        if selectedGoals.contains("Пить больше воды") {
    //            waterAmount += 500
    //        }
    //        if selectedGoals.contains("Снизить вес") {
    //            waterAmount += 300
    //        }
    //        if selectedGoals.contains("Улучшить состояние кожи") {
    //            waterAmount += 250
    //        }
    //        if selectedGoals.contains("Вести здоровый образ жизни") {
    //            waterAmount += 200
    //        }
    //        if selectedGoals.contains("Улучшить пищеварение") {
    //            waterAmount += 250
    //        }
    //
    //        return waterAmount
    //    }
    //
    //    @IBAction func submitButtonTapped(_ sender: UIButton) {
    //        print("Submit button tapped")
    //        guard validateInputs() else {
    //            print("Validation failed")
    //            return
    //        }
    //
    //        let waterAmount = calculateWaterAmount()
    //        print("Calculated water amount: \(waterAmount)")
    //        showResult(waterAmount: waterAmount)
    //    }
    //
    //    func showResult(waterAmount: Double) {
    //        print("Showing result")
    //        let alert = UIAlertController(title: "Рекомендуемое количество воды",
    //                                      message: "Вам рекомендуется пить \(Int(waterAmount)) мл воды в день",
    //                                      preferredStyle: .alert)
    //        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
    //            self?.navigateToNextScreen()
    //        }
    //        alert.addAction(okAction)
    //        present(alert, animated: true, completion: nil)
    //    }
    //
    //    func navigateToNextScreen() {
    //        performSegue(withIdentifier: "NextViewController", sender: self)
    //    }
    //}
    
    
    
    
}
