//
//  ResultViewController.swift
//  YSKcal
//
//  Created by yusuke matsukawa on 2019/04/08.
//  Copyright © 2019 yusuke matsukawa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var price: Int = 0
    var discount: Float = 0
    let percentValue: Float = 0.1
    
    @IBOutlet weak var resultField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discount = discount/100
        let waribikiPrice = Float(price)*discount
        let percentOffPrice = price - Int( waribikiPrice)
        resultField.text = "\(percentOffPrice)"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
