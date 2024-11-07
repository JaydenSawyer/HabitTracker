import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
   
    var delegate: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty else {
            
            return
        }

        delegate?.addHabit(name: name, description: description)
        
        
        navigationController?.popViewController(animated: true)
    }
}
