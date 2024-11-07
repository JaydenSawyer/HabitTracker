//
//  ViewController.swift
//  HabitTracker
//
//  Created by JAYDEN SAWYER on 10/29/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    var habits: [Habit] = []

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

       
        tableView.delegate = self
        tableView.dataSource = self
        
        let sleep = Habit(name: "sleep", description: "sleep for 8 hours today")
        
        let exercise = Habit(name: "Exercise", description: "Go for a 30 minute run")

        
        let meditation = Habit(name: "Meditation", description: "Do 10 minutes of meditation")
        habits.append(meditation)
        habits.append(exercise)
        habits.append(sleep)
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
        
    }
    @IBAction func resetButton(_ sender: UIButton) {
        
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
