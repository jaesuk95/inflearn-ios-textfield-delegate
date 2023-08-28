//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Jaesuk Lee on 2023/08/28.
//

import UIKit

class ViewController: UIViewController {

    // textField
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }

    func setup() {
        view.backgroundColor = UIColor.gray
        
        // keyboard setting
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .go   // <- changes the 'done' button
    }

    // done button
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
    
}

