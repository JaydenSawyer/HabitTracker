//
//  ViewController.swift
//  HabitTracker
//
//  Created by JAYDEN SAWYER on 10/29/24.
//

import UIKit

class Habit: Codable {
    var name: String
    var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var habits: [Habit] = []
    let defaults = UserDefaults.standard
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let savedData = defaults.data(forKey: "myHabits") {
            let decoder = JSONDecoder()
            if let loadedHabits = try? decoder.decode([Habit].self, from: savedData) {
                habits = loadedHabits
            }
        }

        if habits.isEmpty {
            let sleep = Habit(name: "Sleep", description: "Sleep for 8 hours today")
            let exercise = Habit(name: "Exercise", description: "Go for a 30-minute run")
            let meditation = Habit(name: "Meditation", description: "Do 10 minutes of meditation")
            habits.append(sleep)
            habits.append(exercise)
            habits.append(meditation)
        }

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell", for: indexPath)
        let habit = habits[indexPath.row]
        cell.textLabel?.text = habit.name
        cell.detailTextLabel?.text = habit.description
        return cell
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(habits) {
            defaults.set(encodedData, forKey: "myHabits")
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        defaults.removeObject(forKey: "myHabits")
        habits.removeAll()
        tableView.reloadData()
    }
    
    func addHabit(name: String, description: String) {
        let newHabit = Habit(name: name, description: description)
        habits.append(newHabit)
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ViewController3 {
            destinationVC.delegate = self
        }
    }
}
