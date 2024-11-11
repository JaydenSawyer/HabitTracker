//
//  ViewController.swift
//  HabitTracker
//
//  Created by JAYDEN SAWYER on 10/29/24.
//

import UIKit


class Habit : Codable{
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
        if let hab = defaults.array(forKey: "myHabits"){
            habits = hab as! [Habit]
        }
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
        defaults.set(habits, forKey: "myHabits")
    }
    @IBAction func resetButton(_ sender: UIButton) {
        defaults.removeObject(forKey: "myHabits")
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
