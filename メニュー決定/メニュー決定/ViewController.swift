//
//  ViewController.swift
//  メニュー決定
//
//  Created by yusuke matsukawa on 2019/04/15.
//  Copyright © 2019 yusuke matsukawa. All rights reserved.
//

import UIKit

@IBDesignable
class Button_Custom: UIButton {
    
    @IBInspectable var textColor: UIColor?
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var typeField: UILabel!
    @IBOutlet weak var meatField: UILabel!
    @IBOutlet weak var moneyresult: UILabel!
    @IBOutlet weak var mbuttun: UIButton!
    @IBOutlet weak var nbuttun: UIButton!
    @IBOutlet weak var cButtun: UIButton!
    @IBOutlet weak var pButtun: UIButton!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var ibuttun: UISwitch!
    @IBOutlet weak var rbuttun: UISwitch!
    
    var type: Int!
    var meattype: Int!
    var ingredient: Int!
    var rice: Int!
    
    var food = [[String]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        type = 0
        meattype = 0
        let signBoard = UIImage(named: "maruichi")
        image1.image = signBoard
        mbuttun.isEnabled = true
        nbuttun.isEnabled = true
        cButtun.isEnabled = true
        pButtun.isEnabled = true
        ibuttun.isEnabled = true
        rbuttun.isEnabled = true
        
        //外部ファイルの追加
        var csvLines = [String]()
        
        guard let path = Bundle.main.path(forResource:"food", ofType:"csv") else {
            print("csvファイルがないよ")
            return
        }
        
        do {
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            csvLines = csvString.components(separatedBy: .newlines)
            csvLines.removeLast()
        } catch let error as NSError {
            print("エラー: \(error)")
            return
        }
        for animalData in csvLines {
            food.append(animalData.components(separatedBy: ","))
        }
        let re = food.count
        print(re)
    }
    
    
    @IBAction func iButtun(_ sender: UISwitch) {
        if sender.isOn {
            ingredient = 1
            type = 1
        } else {
            type = 0
            ingredient = 0
        }
        
    }
    @IBAction func rButtun(_ sender: UISwitch) {
        if sender.isOn {
            type = 1
            rice = 1
        }else {
            type = 0
            rice = 0
        }
        
    }
    
    @IBAction func meatButtun(_ sender: UIButton) {
        type = 1
        meattype = 0
        mbuttun.isEnabled = false
        nbuttun.isEnabled = true
        if type == 1 {
            ibuttun.isEnabled = true
            rbuttun.isEnabled = true
        }
    }
    @IBAction func noodleButtun(_ sender: UIButton) {
        type = 2
        meattype = 3
        mbuttun.isEnabled = true
        nbuttun.isEnabled = false
        cButtun.isEnabled = true
        pButtun.isEnabled = true
        if type == 2 {
            rice = 0
            ingredient = 0
            rbuttun.isOn = false
            ibuttun.isOn = false
            ibuttun.isEnabled = false
            rbuttun.isEnabled = false
        }
    }
    @IBAction func chikinButtun(_ sender: UIButton) {
        meattype = 1
        cButtun.isEnabled = false
        pButtun.isEnabled = true
        if type == 2 {
            meattype = 3
            rice = 0
            ingredient = 0
            rbuttun.isOn = false
            ibuttun.isOn = false
            cButtun.isEnabled = true
        }
    }
    @IBAction func pookButtun(_ sender: UIButton) {
        meattype = 2
        cButtun.isEnabled = true
        pButtun.isEnabled = false
        if type == 2 {
            meattype = 3
            rice = 0
            ingredient = 0
            rbuttun.isOn = false
            ibuttun.isOn = false
            pButtun.isEnabled = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func decideButtun(_ sender: UIButton) {
        
        let foodnumber = foodSelect()
        var payment = 0
        result.text = food[foodnumber][0]
        if ingredient == 1 {
            payment = Int(food[foodnumber][3])! + 100
        } else {
            payment = Int(food[foodnumber][3])!
        }
        if rice == 1 {
            payment += 100
        }
        moneyresult.text = String(payment)
        let foodpicture = food[foodnumber][4]
        let image = UIImage(named: foodpicture)
        image1.image = image
        mbuttun.isEnabled = true
        nbuttun.isEnabled = true
        cButtun.isEnabled = true
        pButtun.isEnabled = true
        ibuttun.isEnabled = true
        rbuttun.isEnabled = true
        rbuttun.isOn = false
        ibuttun.isOn = false
        type = 0
        rice = 0
        ingredient = 0
        meattype = 0
    }
    private func foodSelect() -> Int {
        var keyword1: String!
        var keyword2: String!
        var resultA: Set<Int> = []
        var count = 0
        var sub2: Int!
        var i = 0
        if type == 1 {
            keyword1 = "肉"
        } else if type == 2 {
            keyword1 = "麺"
        } else if type == 0 {
            keyword1 = "other"
        }
        if meattype == 1 {
            keyword2 = "とり"
        } else if meattype == 2{
            keyword2 = "豚"
        } else if meattype == 3{
            keyword2 = "麺"
        } else if meattype == 0{
            keyword2 = "other"
        }
        
        if (type == 1 && meattype == 0) || (type == 2 && meattype == 0) {
            count = 0
            i = 0
            let ele = food.count
            while i < ele {
                if keyword1 == food[i][1] {
                    resultA.insert(count)
                }
                count += 1
                i += 1
            }
            
            let tmp = Array(resultA)
            sub2 = tmp[Int(arc4random()) % tmp.count]
            return sub2
        }
       
        if type == 0 && meattype == 0 {
            count = 0
            i = 0
            let ele = food.count
            while i < ele {
                resultA.insert(count)
                count += 1
                i += 1
            }
            let tmp = Array(resultA)
            sub2 = tmp[Int(arc4random()) % tmp.count]
            
            return sub2
        }
        
        if (type == 0 && meattype == 1) || (type == 0 && meattype == 2) || (type == 1 && meattype == 1) || (type == 1 && meattype == 2) || (type == 2 && meattype == 3) {
            count = 0
            i = 0
            let ele = food.count
            while i < ele {
                if keyword2 == food[i][2] {
                    resultA.insert(count)
                }
                count += 1
                i += 1
            }
            let tmp = Array(resultA)
            sub2 = tmp[Int(arc4random()) % tmp.count]
            return sub2
        }
     return 0
    }
}

