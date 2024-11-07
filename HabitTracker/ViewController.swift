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

        
        let meditation = Habit(name: "Meditation", description: "Do 10 minutes of meditation")
        habits.append(meditation)
    }

    // Table view methods
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
    
    
    func addHabit(name: String, description: String) {
        let newHabit = Habit(name: name, description: description)
        habits.append(newHabit)
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? ViewController2 {
            destinationVC.delegate = self
        }
    }
}
