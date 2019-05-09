//
//  ViewController.swift
//  YSKcal
//
//  Created by yusuke matsukawa on 2019/04/08.
//  Copyright © 2019 yusuke matsukawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var priceField: UITextField!
   
    @IBOutlet weak var discountField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButtun0(_ sender: Any) {
        let value = priceField.text! + "0"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap1Buttun(_ sender: Any) {
        let value = priceField.text! + "1"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    
    @IBAction func tapButtun2(_ sender: Any) {
        let value = priceField.text! + "2"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    
    @IBAction func tap3Buttun(_ sender: Any) {
        let value = priceField.text! + "3"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap4Buttun(_ sender: Any) {
        let value = priceField.text! + "4"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    
    @IBAction func tap5Buttun(_ sender: Any) {
        let value = priceField.text! + "5"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap6Buttun(_ sender: Any) {
        let value = priceField.text! + "6"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap7Buttun(_ sender: Any) {
        let value = priceField.text! + "7"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap8Buttun(_ sender: Any) {
        let value = priceField.text! + "8"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    @IBAction func tap9Buttun(_ sender: Any) {
        let value = priceField.text! + "9"
        if let price = Int(value){
            priceField.text = "\(price)"
        }
    }
    
    @IBAction func tap00Buttun(_ sender: Any) {
        let value = priceField.text! + "00"
        if let price = Int(value) {
            priceField.text = "\(price)"
        }
    }
    @IBAction func tapCButtun(_ sender: Any) {
        priceField.text = "0"
    }
    @IBAction func restart(_ segue: UIStoryboardSegue){
        priceField.text = "0"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let viewController = segue.destination as! ResultViewController
        if let price = Int(priceField.text!){
            viewController.price = price
        }
        if let discount = Float(discountField.text!){
            viewController.discount = discount
        }
    }
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

