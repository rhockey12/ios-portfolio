//
//  ViewController.swift
//  Give me your money slots
//
//  Created by 90303405 on 9/17/18.
//  Copyright © 2018 Ryan Thomas. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
//    var game = gamedata()
    var money = 1000
    

    override func viewDidLoad() {
                super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Moneylabel.text = "$\(money)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var Moneylabel: UILabel!
    @IBOutlet weak var Winlabel: UILabel!
    
   
    
    
        
    @IBAction func SlotLever(_ sender: UIButton) {
//     for _ in 0...20{
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            // your code here
//
//
//
//
//
//                let randomuno = arc4random_uniform(6)
//                let randomdos = arc4random_uniform(6)
//                let randomtres = arc4random_uniform(6)
//
//
//                self.image1.image = UIImage(named: ("\(randomuno)"))
//                self.image2.image = UIImage(named:("\(randomdos)"))
//                self.image3.image = UIImage(named:("\(randomtres)"))
//
//
//
//
//
//        }
//
//        }
        
        
        
        
        
        
        let random1 = arc4random_uniform(6)
        let random2 = arc4random_uniform(6)
        let random3 = arc4random_uniform(6)
        
        image1.image = UIImage(named: ("\(random1)"))
        image2.image = UIImage(named:("\(random2)"))
        image3.image = UIImage(named:("\(random3)"))
        
        
        
        if random1 == random2 && random2 == random3{
            
            if random1 == 0 {
                
                money = money+10
                Winlabel.text = ("Win! +10")
            }else if random1 == 1{
                
                money = money+20
                Winlabel.text = ("Win! +20")
            }else if random1 == 2{
                
               money = money + 30
                Winlabel.text = ("Win! +30")
            }else if random1 == 3{
                
                money = money + 200
                Winlabel.text = ("Jackpot!!! +200")
            }else if random1 == 4{
                
                money = money + 100
                Winlabel.text = ("Big Win!! +75")
            }else {
                
                money = money + 50
                Winlabel.text = ("Big Win! +50")
            }
            
        }else if random1 == random2{
            
            money = money + 5
            Winlabel.text = ("Win! +5")
        }else if random2 == random3{
            
            money = money + 5
            Winlabel.text = ("Win! +5")
        }else{
            
            money = money - 10
            Winlabel.text = ("Try Again!")
        }
        
        
        Moneylabel.text = ("$ \(money)")
        
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var secondController = segue.destination as! ViewController2
        secondController.money = money
    }
  
    
    }
    

    
    
    
    




