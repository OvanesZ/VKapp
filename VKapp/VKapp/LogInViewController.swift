//
//  ViewController.swift
//  VKapp
//
//  Created by Ovanes on 14.02.2021.
//

import UIKit

class LogInViewController: UIViewController {
    
    // MARK: - Properties

    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        print("login \(loginTextField.text ?? "")")
        print("password \(passwordTextField.text ?? "")")
    }
    
}

