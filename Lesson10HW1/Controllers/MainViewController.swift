//
//  ViewController.swift
//  Lesson10HW1
//
//  Created by vaksakalov on 20.06.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var dictionaryWordTextField: UITextField!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryWordTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    @IBAction func showResultButtonAction() {
        
        resultTextView.text = ""
        activityIndicatorView.startAnimating()
        
        NetworkManager.fetchDataFromDictionaryApi(with: dictionaryWordTextField.text ?? "", completion: { message in
            
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.resultTextView.text = "\(message)"
            }
            
        })
    }

}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        showResultButtonAction()
        return false
    }
    
}

