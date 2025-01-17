//
//  test.swift
//  water
//
//  Created by Кирилл Титов on 08.07.2024.
//

import UIKit

class test: UIViewController {
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var workoutFrequencySegmentedControl: UISegmentedControl!
    @IBOutlet weak var weatherSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sweetDrinksSegmentedControl: UISegmentedControl!
    @IBOutlet weak var coffeeEnergyDrinksSegmentedControl: UISegmentedControl!
    @IBOutlet weak var vegetablesFruitsSegmentedControl: UISegmentedControl!
    @IBOutlet weak var goalsStackView: UIStackView!
    @IBOutlet weak var fullScreenImage: UIImageView!
    
    @IBOutlet weak var questionsStackView: UIStackView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var gender: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup initial UI elements
        setupInitialQuestions()
    }
    
    // MARK: - Properties
    var selectedGoals: [String] = []
    var currentQuestionIndex: Int = 0
    let questions: [String] = [
        "Ваш пол?",
        "Ваш вес?",
        "Ваш рост?",
        "Ваш возраст?",
        "Ваше имя?",
        "Как часто вы тренируетесь?",
        "Какую погоду вы предпочитаете?",
        "Как часто пьете сладкие напитки?",
        "Как часто пьете кофе или энергетики?",
        "Как часто едите овощи и фрукты?",
    ]
    
    let goalsQuestionIndex: Int = 10
    
    // MARK: - UI Setup
    func setupUI() {
        setupSegmentedControls()
        setupTextFields()
        setupInitialQuestions()
        updateQuestion()
    }
    
    func setupSegmentedControls() {
        genderSegmentedControl.removeAllSegments()
        genderSegmentedControl.insertSegment(withTitle: "Мужской", at: 0, animated: false)
        genderSegmentedControl.insertSegment(withTitle: "Женский", at: 1, animated: false)
        genderSegmentedControl.selectedSegmentIndex = 0
        
        setupSegmentedControl(workoutFrequencySegmentedControl, withTitles: ["Редко", "Регулярно", "Часто"])
        setupSegmentedControl(weatherSegmentedControl, withTitles: ["Холодно", "Нормально", "Жарко"])
        setupSegmentedControl(sweetDrinksSegmentedControl, withTitles: ["Почти никогда", "Редко", "Регулярно", "Часто"])
        setupSegmentedControl(coffeeEnergyDrinksSegmentedControl, withTitles: ["Почти никогда", "Редко", "Регулярно", "Часто"])
        setupSegmentedControl(vegetablesFruitsSegmentedControl, withTitles: ["Редко", "Регулярно", "Часто"])
    }
    
    func setupSegmentedControl(_ control: UISegmentedControl, withTitles titles: [String]) {
        control.removeAllSegments()
        for (index, title) in titles.enumerated() {
            control.insertSegment(withTitle: title, at: index, animated: false)
        }
        control.selectedSegmentIndex = 0
    }
    
    func setupTextFields() {
        weightTextField.keyboardType = .decimalPad
        heightTextField.keyboardType = .numberPad
        ageTextField.keyboardType = .numberPad
    }
    
//    func setupGoalsCheckboxes() {
//        let goals = ["Пить больше воды", "Снизить вес", "Улучшить состояние кожи", "Вести здоровый образ жизни", "Улучшить пищеварение"]
//        for goal in goals {
//            let checkbox = UIButton(type: .system)
//            checkbox.setTitle(goal, for: .normal)
//            checkbox.addTarget(self, action: #selector(goalCheckboxTapped(_:)), for: .touchUpInside)
//            goalsStackView.addArrangedSubview(checkbox)
//        }
//    }
    
    func setupInitialQuestions() {
        questionsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        let questionLabel = UILabel()
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        questionsStackView.addArrangedSubview(questionLabel)
    }
    
    @IBAction func changeGenderSegment(_ sender: Any) {
        guard let segment = sender as? UISegmentedControl else { return }
        switch segment.selectedSegmentIndex {
        case 0: gender = true
        case 1: gender = false
        default:
            break
        }
    }
    
    func updateQuestion() {
        if currentQuestionIndex < questions.count {
            if let questionLabel = questionsStackView.arrangedSubviews.first as? UILabel {
                questionLabel.text = questions[currentQuestionIndex]
            }
            progressBar.progress = Float(currentQuestionIndex + 1) / Float(questions.count)
            showRelevantInputForCurrentQuestion()
        } else {
            submitButtonTapped(nextButton)
        }
    }
    
    func showRelevantInputForCurrentQuestion() {
        genderSegmentedControl.isHidden = true
        weightTextField.isHidden = true
        heightTextField.isHidden = true
        ageTextField.isHidden = true
        nameTextField.isHidden = true
        workoutFrequencySegmentedControl.isHidden = true
        weatherSegmentedControl.isHidden = true
        sweetDrinksSegmentedControl.isHidden = true
        coffeeEnergyDrinksSegmentedControl.isHidden = true
        vegetablesFruitsSegmentedControl.isHidden = true
        
        switch currentQuestionIndex {
        case 0:
            genderSegmentedControl.isHidden = false
        case 1:
            weightTextField.isHidden = false
        case 2:
            heightTextField.isHidden = false
        case 3:
            ageTextField.isHidden = false
        case 4:
            nameTextField.isHidden = false
        case 5:
            workoutFrequencySegmentedControl.isHidden = false
        case 6:
            weatherSegmentedControl.isHidden = false
        case 7:
            sweetDrinksSegmentedControl.isHidden = false
        case 8:
            coffeeEnergyDrinksSegmentedControl.isHidden = false
        case 9:
            vegetablesFruitsSegmentedControl.isHidden = false
        default:
            break
        }
    }
    
    @objc func goalCheckboxTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            selectedGoals.append(sender.titleLabel?.text ?? "")
        } else {
            selectedGoals.removeAll { $0 == sender.titleLabel?.text }
        }
    }
    
    // MARK: - Helper Methods
    func validateInputs() -> Bool {
        // Проверка заполнения всех полей
        // Возвращает false и показывает alert, если что-то не заполнено
        return true // Замените на реальную логику валидации
    }
    
    func calculateWaterAmount() -> Double {
        // Базовое количество воды
        var waterAmount = 30.0 * (Double(weightTextField.text ?? "0") ?? 0)
        
        // Учет факторов
        if workoutFrequencySegmentedControl.selectedSegmentIndex > 0 {
            waterAmount += 300 // Дополнительно при регулярных тренировках
        }
        
        if weatherSegmentedControl.selectedSegmentIndex == 2 {
            waterAmount += 500 // Дополнительно в жаркую погоду
        }
        
        if sweetDrinksSegmentedControl.selectedSegmentIndex > 1 {
            waterAmount += 200 // Дополнительно при частом употреблении сладких напитков
        }
        
        if coffeeEnergyDrinksSegmentedControl.selectedSegmentIndex > 1 {
            waterAmount += 200 // Дополнительно при частом употреблении кофе и энергетиков
        }
        
        if vegetablesFruitsSegmentedControl.selectedSegmentIndex < 1 {
            waterAmount += 200 // Дополнительно при редком употреблении овощей и фруктов
        }
        
        return waterAmount
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentQuestionIndex += 1
        updateQuestion()
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        print("Submit button tapped")
        guard validateInputs() else {
            print("Validation failed")
            return
        }
        
        let waterAmount = calculateWaterAmount()
        print("Calculated water amount: \(waterAmount)")
        showResult(waterAmount: waterAmount)
    }
    
    func showResult(waterAmount: Double) {
        print("Showing result")
        let alert = UIAlertController(title: "Рекомендуемое количество воды",
                                      message: "Вам рекомендуется пить \(Int(waterAmount)) мл воды в день",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            self?.navigateToNextScreen()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func navigateToNextScreen() {
        guard
            let age = ageTextField.text,
            let weight = weightTextField.text,
            let height = heightTextField.text,
            let name = nameTextField.text
        else { return }
        let user = User(age: Int(age) ?? 15, gender: gender, weight: Int(weight) ?? 50, height: Int(height) ?? 150, name: name, total: calculateWaterAmount())
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(user)
            UserDefaults.standard.set(data, forKey: "user")
        } catch {
            print("failed")
        }
        performSegue(withIdentifier: "NextViewController", sender: self)
    }
}

