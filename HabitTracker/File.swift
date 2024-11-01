//
//  File.swift
//  HabitTracker
//
//  Created by JAYDEN SAWYER on 10/30/24.
//

import Foundation

class Habit{
    var Name: String
    var description: String
    var Completed: Int
    var Goal: Int
    
    init(Name: String, description: String, Completed: Int, Goal: Int) {
        self.Name = Name
        self.description = description
        self.Completed = Completed
        self.Goal = Goal
    }
}

