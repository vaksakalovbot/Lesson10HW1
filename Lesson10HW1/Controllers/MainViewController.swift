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
        
        NetworkManager.fetchDataFromDictionaryApi(with: dictionaryWordTextField.text ?? "", completion: { modelJsonDictionaryApi, error in
            
            if let error = error {
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.resultTextView.text = "\(error.localizedDescription)"
                }
                return
            }
            
            if let modelJsonDictionaryApi = modelJsonDictionaryApi {
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.resultTextView.text = "\(modelJsonDictionaryApi.first?.showResult() ?? "Nothing")"
                }
            }
            
        })
    }

}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        showResultButtonAction()
        return true
    }
    
}

