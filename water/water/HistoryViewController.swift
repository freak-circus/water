import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentStreakLabel: UILabel!
    @IBOutlet weak var bestStreakLabel: UILabel!
    
    let history = WaterIntakeHistory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        populateHistory()
        
        updateStreakLabels()
    }
    
    func populateHistory() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/01")!, amount: 1.5, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/02")!, amount: 2.0, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/03")!, amount: 2.5, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/04")!, amount: 1.0, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/05")!, amount: 3.0, target: 2.0))
        history.addRecord(WaterIntakeDay(date: dateFormatter.date(from: "2024/07/06")!, amount: 2.5, target: 2.0))
    }
    
    func updateStreakLabels() {
        currentStreakLabel.text = "Current Streak: \(history.getCurrentStreak())"
        bestStreakLabel.text = "Best Streak: \(history.getBestStreak())"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.getRecords().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryCell else {
            return UITableViewCell()
        }
        
        let record = history.getRecords().reversed()[indexPath.row]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        cell.dateLabel.text = dateFormatter.string(from: record.date)
        cell.waterIntakeLabel.text = "Water: \(record.amount)L / \(record.target)L"
        cell.targetIndicatorLabel.text = record.isSuccess ? "✅" : "❌"
        
        return cell
    }
}
