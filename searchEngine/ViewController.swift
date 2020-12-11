//
//  ViewController.swift
//  searchEngine
//
//  Created by Venkatesh on 10/12/2020.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    var googleManager = GoogleManager()
    var duckManager = DuckManager()
    @IBOutlet weak var DuckSearchTextField: UITextField!
    @IBOutlet weak var googleSearchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DuckSearchTextField.delegate = self
        googleSearchTextField.delegate = self
        
    }
//google search engines search button
    @IBAction func se_search(_ sender: UIButton) {
        googleSearchTextField.endEditing(true)
        
    }
//    duckduckgo search engines search button
    @IBAction func mse_search(_ sender: UIButton) {
        DuckSearchTextField.endEditing(true)
    }
    //MARK: -clear TextField
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let googleKeyword = googleSearchTextField.text{
            googleManager.getGoogleData(keyword: googleKeyword)
            
        }
        if let duckKeyword = DuckSearchTextField.text{
            duckManager.getDuckData(keyword: duckKeyword)
        }
        googleSearchTextField.text = ""
        DuckSearchTextField.text = ""
    }
}

