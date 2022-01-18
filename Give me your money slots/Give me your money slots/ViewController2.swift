//
//  ViewController2.swift
//  Give me your money slots
//
//  Created by 90303405 on 10/3/18.
//  Copyright © 2018 Ryan Thomas. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    var money = 0
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var firstController = segue.destination as! ViewController
        firstController.money = money
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        MoneyLabel.text = "$\(money)"
        WhatsupLabel.text = "Tap the bank to rob it"
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var MoneyLabel: UILabel!
   
    
    @IBOutlet weak var WhatsupLabel: UILabel!
    var Random = 0
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func BankButton(_ sender: Any) {
        Random = Int(arc4random_uniform(100))
        if Random > 0 && Random < 50{
            
            WhatsupLabel.text = "The cops caught you! -$200"
            money = money - 200
            MoneyLabel.text = "$\(money)"
            
        }else{
            
            WhatsupLabel.text = "You robbed the bank! +$200"
            money = money + 200
            MoneyLabel.text = "$\(money)"
            
        }
        
        
    }
}
