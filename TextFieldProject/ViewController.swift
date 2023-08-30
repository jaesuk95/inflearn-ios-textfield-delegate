//
//  ViewController.swift
//  TextFieldProject
//
//  Created by Jaesuk Lee on 2023/08/28.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // textField
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField.delegate = self
        
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
        
        
        
        // 시작하자 마자 키보드 실행
        textField.becomeFirstResponder()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

    // textField 의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 시점
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // textField 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출리 되고 (허락)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(#function)
        print(string)
        
        
        // from google (maximum string length set to 10)
//        let maxLength = 10
//        let currentString: NSString = (textField.text ?? "") as NSString
//        let newString: NSString =
//        currentString.replacingCharacters(in: range, with: string) as NSString
//        return newString.length <= maxLength
        
        // 입력되고 있는 글자가 "숫자" 인경우 입력을 혀용하지 않는 논리
        if Int(string) != nil { // 숫자로 변환이 된다면 nil 이 아닐테니
            return false
        } else {
            // 10 글자이상 입력되는 것을 막는 코드
            guard let text = textField.text else {return true}
            let newLength = text.count + string.count - range.length
            return newLength <= 10
        }
        
        // 10 글자이상 입력되는 것을 막는 코드 (또다른 구현법)
//        if (textField.text?.count) + string.count > 10 {
//            return false
//        } else {
//            return true
//        }
    }
    
    // textField 엔터키가 눌러지면 다음 동작을 허락할 것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
        
    }
    
    // textField 의 입력이 끝날 때 호출 (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // textField 입력이 실제 끝날을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("User has finished texting")
        textField.text = ""
//        return
    }
    
    // done button
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
}

