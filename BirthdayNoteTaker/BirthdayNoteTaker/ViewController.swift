//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Jim Theodoropoulos on 19/3/20.
//  Copyright © 2020 Jim Theodoropoulos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //Casting as? vs as! force casting
        if let myName = storedName as? String {
            nameLabel.text = "Name: \(myName)"
        }
        if let myBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(myBirthday)"
        }
    }

  
    @IBAction func saveButton(_ sender: UIButton) {
        //save data
        UserDefaults.standard.set(nameTextField.text!, forKey: "name") //you store key-value pairs persistently across launches of your app.
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize() is old
        
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
        
        
    }
    @IBAction func deleteButton(_ sender: UIButton) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
         // "" vs nil
        if (storedName as? String) != nil {
            UserDefaults.standard.set(nameTextField.text!, forKey: "name")
            nameLabel.text = "Name:"
        }
        if (storedBirthday as? String) != nil {
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        birthdayLabel.text = "Birthday:"
    }
    
    
}

}
