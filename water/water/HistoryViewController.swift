import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let history = WaterIntakeHistory()
    var streaks: [Int] = []
    var bestStreak = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        populateHistory()
        calculateStreaks()
    }
    
    func populateHistory() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/03")!, amount: 2.5, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/04")!, amount: 1.0, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/05")!, amount: 3.0, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/06")!, amount: 2.5, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/07")!, amount: 3.5, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/08")!, amount: 2.5, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/09")!, amount: 1.7, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/10")!, amount: 2.5, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/11")!, amount: 2.3, target: 2.0))
    }
    
    func calculateStreaks() {
        let records = history.getRecords()
        var currentStreak = 0
        
        for record in records {
            if record.isSuccess {
                currentStreak += 1
                if currentStreak > bestStreak {
                    bestStreak = currentStreak
                }
            } else {
                currentStreak = 0
            }
            streaks.append(currentStreak)
        }
        
        streaks.reverse()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.getRecords().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryCell else {
            return UITableViewCell()
        }
        
        let record = history.getRecords().reversed()[indexPath.row]
        let streak = streaks[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        if Calendar.current.isDateInToday(record.date){
            cell.dateLabel.text = "Сегодня"
        }
        else if Calendar.current.isDateInYesterday(record.date){
            cell.dateLabel.text = "Вчера"
        }
        else {
            dateFormatter.dateFormat = "EEEE, d MMMM"
            dateFormatter.locale = Locale(identifier: "ru_RU")
            cell.dateLabel.text = dateFormatter.string(from: record.date)
        }
        
        cell.waterIntakeLabel.text = "\(record.amount)L / \(record.target)L"
        cell.targetIndicatorImageView.image = UIImage(named: record.isSuccess ? "success" : "failure")
        
        cell.streakLabel.text = "Дней подряд: \(streak)"
        if streak == bestStreak {
            cell.streakLabel.textColor = .green
            cell.streakLabel.text! += " 🏆"
        } else if streak > 0 {
            cell.streakLabel.text! += " 🔥"
        } else {
            cell.streakLabel.textColor = .red
            cell.streakLabel.text! += " ❌"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114
    }
}
