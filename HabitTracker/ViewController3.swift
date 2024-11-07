//
//  ViewController3.swift
//  HabitTracker
//
//  Created by JAYDEN SAWYER on 10/29/24.
//

import UIKit

class ViewController3: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    var delegate: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty else {
            
            return
        }
        delegate?.addHabit(name: name, description: description)
        
        
        navigationController?.popViewController(animated: true)
        
    }
    
   
}
