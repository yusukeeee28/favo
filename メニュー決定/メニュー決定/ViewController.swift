//
//  ViewController.swift
//  メニュー決定
//
//  Created by yusuke matsukawa on 2019/04/15.
//  Copyright © 2019 yusuke matsukawa. All rights reserved.
//

import UIKit

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
    let nameFood = ["メンチかつ丼", "タレカツ丼", "タルタル丼", "うどん"]
    let keyAFood = ["肉", "肉", "肉", "麺"]
    let keyBFood = ["とり", "豚", "とり", "麺"]
    let moneyFood = [300, 300, 300, 300]
    let picture = ["mennchi", "タレカツ丼", "maruichi", "maruichi"]
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
        meattype = 0
        mbuttun.isEnabled = true
        nbuttun.isEnabled = false
        cButtun.isEnabled = true
        pButtun.isEnabled = true
        if type == 2 {
            ibuttun.isEnabled = false
            rbuttun.isEnabled = false
        }
    }
    @IBAction func chikinButtun(_ sender: UIButton) {
        meattype = 1
        cButtun.isEnabled = false
        pButtun.isEnabled = true
        if type == 2 {
            meattype = 0
            cButtun.isEnabled = true
        }
    }
    @IBAction func pookButtun(_ sender: UIButton) {
        meattype = 2
        cButtun.isEnabled = true
        pButtun.isEnabled = false
        if type == 2 {
            meattype = 0
            pButtun.isEnabled = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func decideButtun(_ sender: UIButton) {
        
        let foodnumber = foodSelect()
        var payment = 0
        result.text = nameFood[foodnumber]
        if ingredient == 1 {
            payment = moneyFood[foodnumber] + 100
        } else {
            payment = moneyFood[foodnumber]
        }
        if rice == 1 {
            payment += 100
        }
        moneyresult.text = String(payment)
        let foodpicture = picture[foodnumber]
        let image = UIImage(named: foodpicture)
        image1.image = image
        mbuttun.isEnabled = true
        nbuttun.isEnabled = true
        cButtun.isEnabled = true
        pButtun.isEnabled = true
        ibuttun.isEnabled = true
        rbuttun.isEnabled = true
        
        type = 0
        if ingredient == 1 {
            type = 1
        }
        if rice == 1 {
            type = 1
        }
        meattype = 0
    }
    private func foodSelect() -> Int {
        var keyword1: String!
        var keyword2: String!
        var resultA: Set<Int> = []
        var resultB: Set<Int> = []
        var count = 0
        var sub2: Int!
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
        } else if meattype == 0{
            keyword2 = "麺"
        }
        
        if type == 1 && meattype == 0 {
            count = 0
            for keyA in keyAFood {
                if keyA == keyword1 {
                    resultA.insert(count)
                }
                count += 1
            }
            let tmp = Array(resultA)
            sub2 = tmp[Int(arc4random()) % tmp.count]
            return sub2
        }
        if type == 2 && meattype == 0 {
            count = 0
            for keyA in keyAFood {
                if keyA == keyword1 {
                    resultA.insert(count)
                }
                count += 1
            }
            let tmp = Array(resultA)
            sub2 = tmp[Int(arc4random()) % tmp.count]
            return sub2
        }
        if type == 0 && meattype == 0 {
            count = 0
            for _ in keyAFood {
                resultA.insert(count)
                count += 1
            }
            let tmp = Array(resultA)
            sub2 = tmp[Int(arc4random()) % tmp.count]
            
            return sub2
        }
        if type == 0 && meattype == 1 {
            count = 0
            for keyA in keyBFood {
                if keyA == keyword2 {
                    resultA.insert(count)
                }
                count += 1
            }
            let tmp = Array(resultA)
            sub2 = tmp[Int(arc4random()) % tmp.count]
            return sub2
        }
        if type == 0 && meattype == 2 {
            count = 0
            for keyA in keyBFood {
                if keyA == keyword2 {
                    resultA.insert(count)
                }
                count += 1
            }
            let tmp = Array(resultA)
            sub2 = tmp[Int(arc4random()) % tmp.count]
            return sub2
        }
        count = 0
        for keyA in keyAFood {
            if keyA == keyword1 {
                resultA.insert(count)
            }
            count += 1
        }
        count = 0
        for keyB in keyBFood {
            if keyB == keyword2 {
                resultB.insert(count)
            }
            count += 1
        }
        let sub = resultA.intersection(resultB)
        let sub1 = Array(sub)
        sub2 = sub1[Int(arc4random()) % sub1.count]
        
        return sub2
    }
}

