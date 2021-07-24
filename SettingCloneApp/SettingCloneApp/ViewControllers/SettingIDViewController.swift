//
//  SettingIDViewController.swift
//  SettingCloneApp
//
//  Created by yeonBlue on 2021/07/24.
//

import UIKit

class SettingIDViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupEmailTextField()
    }
    
    // MARK: - Setup
    func setupEmailTextField() {
        emailTextField.addTarget(self,
                                 action: #selector(emailTextFieldDidChangeSelector),
                                 for: .editingChanged)
        
        nextButton.isEnabled = false
    }
    
    // MARK: - Selector
    @objc
    func emailTextFieldDidChangeSelector(sender: UITextField) {
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
    }
}
