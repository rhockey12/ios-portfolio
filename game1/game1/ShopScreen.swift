//
//  ShopScreen.swift
//  game1
//
//  Created by 90303405 on 11/1/18.
//  Copyright © 2018 Ryan Thomas. All rights reserved.
//


import Foundation
import GameplayKit
import SpriteKit


class ShopScreen: SKScene{

    
    var buyButton: SKShapeNode!
    var exitButton: SKShapeNode!
    var moneyLabel: SKLabelNode!
    var selectArrow: SKSpriteNode!
    
    var lock1: SKSpriteNode!
    var lock2: SKSpriteNode!
    var lock3: SKSpriteNode!
    var lock4: SKSpriteNode!
    var lock5: SKSpriteNode!
    
    var redDude: SKSpriteNode!
    var greenDude: SKSpriteNode!
    var colorDude: SKSpriteNode!
    var shadesDude: SKSpriteNode!
    var usaDude: SKSpriteNode!
    var blueDude: SKSpriteNode!
    
    override func sceneDidLoad() {
        
        guard let sprite = childNode(withName: "buyButton") as? SKShapeNode else{
            fatalError()
        }
        buyButton = sprite
        
        guard let sprite2 = childNode(withName: "exitButton") as? SKShapeNode else{
            fatalError()
        }
        exitButton = sprite2
        
        guard let label = childNode(withName: "moneyLabel") as? SKLabelNode else{
            fatalError()
        }
        moneyLabel = label
        
        guard let sprite3 = childNode(withName: "selectArrow") as? SKSpriteNode else{
            fatalError()
        }
        selectArrow = sprite3
        
        guard let sprite4 = childNode(withName: "lock1") as? SKSpriteNode else{
            fatalError()
        }
        lock1 = sprite4
        
        guard let sprite5 = childNode(withName: "lock2") as? SKSpriteNode else{
            fatalError()
        }
        lock2 = sprite5
        
        guard let sprite6 = childNode(withName: "lock3") as? SKSpriteNode else{
            fatalError()
        }
        lock3 = sprite6
        
        guard let sprite7 = childNode(withName: "lock4") as? SKSpriteNode else{
            fatalError()
        }
        lock4 = sprite7
        
        guard let sprite8 = childNode(withName: "lock5") as? SKSpriteNode else{
            fatalError()
        }
        lock5 = sprite8
        
        guard let sprite9 = childNode(withName: "redDude") as? SKSpriteNode else{
            fatalError()
        }
        redDude = sprite9
        
        guard let sprite10 = childNode(withName: "greenDude") as? SKSpriteNode else{
            fatalError()
        }
        greenDude = sprite10
        
        guard let sprite11 = childNode(withName: "colorDude") as? SKSpriteNode else{
            fatalError()
        }
        colorDude = sprite11
        
        guard let sprite12 = childNode(withName: "shadesDude") as? SKSpriteNode else{
            fatalError()
        }
        shadesDude = sprite12
        
        guard let sprite13 = childNode(withName: "usaDude") as? SKSpriteNode else{
            fatalError()
        }
        usaDude = sprite13
        
        guard let sprite14 = childNode(withName: "blueDude") as? SKSpriteNode else{
            fatalError()
        }
        blueDude = sprite14
        
        moneyLabel.text = ("\(GameData.playerData.money)")
        
        if GameData.skinData.currentSkin == ("redDude"){
            
            selectArrow.position.y = redDude.position.y
            
        }else if GameData.skinData.currentSkin == ("GreenDude"){
            
            selectArrow.position.y = greenDude.position.y
            
        }else if GameData.skinData.currentSkin == ("BlueDude"){
            
            selectArrow.position.y = blueDude.position.y

        }else if GameData.skinData.currentSkin == ("ShadesDude"){
            
            selectArrow.position.y = shadesDude.position.y
            
        }else if GameData.skinData.currentSkin == ("USADude"){
            
            selectArrow.position.y = usaDude.position.y
            
        }else if GameData.skinData.currentSkin == ("ColorDude"){
            
            selectArrow.position.y = colorDude.position.y
            
        }
        
        
        if GameData.skinData.boughtSkins == 0{
            print ("0 skins bought")
            
            
        }else if GameData.skinData.boughtSkins == 1{
            lock1.removeFromParent()
            greenDude.alpha = 1
            print ("1 skin bought")
        }else if GameData.skinData.boughtSkins == 2{
            lock1.removeFromParent()
            greenDude.alpha = 1
            lock2.removeFromParent()
            blueDude.alpha = 1
             print ("2 skins bought")
        }else if GameData.skinData.boughtSkins == 3{
            lock1.removeFromParent()
            greenDude.alpha = 1
            lock2.removeFromParent()
            blueDude.alpha = 1
            lock3.removeFromParent()
            shadesDude.alpha = 1
            print ("3 skins bought")
        }else if GameData.skinData.boughtSkins == 4{
            lock1.removeFromParent()
            greenDude.alpha = 1
            lock2.removeFromParent()
            blueDude.alpha = 1
            lock3.removeFromParent()
            shadesDude.alpha = 1
            lock4.removeFromParent()
            usaDude.alpha = 1
            print ("4 skins bought")
        }else if GameData.skinData.boughtSkins == 5{
            lock1.removeFromParent()
            greenDude.alpha = 1
            lock2.removeFromParent()
            blueDude.alpha = 1
            lock3.removeFromParent()
            shadesDude.alpha = 1
            lock4.removeFromParent()
            usaDude.alpha = 1
            lock5.removeFromParent()
            colorDude.alpha = 1
            print ("5 skins bought")
        }else{
            lock1.removeFromParent()
            greenDude.alpha = 1
            lock2.removeFromParent()
            blueDude.alpha = 1
            lock3.removeFromParent()
            shadesDude.alpha = 1
            lock4.removeFromParent()
            usaDude.alpha = 1
            lock5.removeFromParent()
            colorDude.alpha = 1
            print ("you already bought all the skins you gamer")
        }
        if GameData.skinData.currentSkin == "redDude"{
            
            selectArrow.position.y = redDude.position.y
            
        }else if GameData.skinData.currentSkin == "GreenDude"{
            
            if GameData.skinData.boughtSkins == 1{
            selectArrow.position.y = greenDude.position.y
            }
            
        }else if GameData.skinData.currentSkin == "BlueDude"{
            
            if GameData.skinData.boughtSkins == 2{
            selectArrow.position.y = blueDude.position.y
            }
            
        }else if GameData.skinData.currentSkin == "ShadesDude"{
            
            if GameData.skinData.boughtSkins == 3{
            selectArrow.position.y = shadesDude.position.y
            }
            
        }else if GameData.skinData.currentSkin == "USADude"{
            
            if GameData.skinData.boughtSkins == 4{
            selectArrow.position.y = usaDude.position.y
            }
            
        }else if GameData.skinData.currentSkin == "RainbowDude"{
            
            if GameData.skinData.boughtSkins == 5{
            selectArrow.position.y = colorDude.position.y
            }
            
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        guard let touch = touches.first else { return }
        let touchlocation = touch.location(in: self)
        UserDefaults.standard.set(GameData.skinData.currentSkin, forKey: "currentSkin")
        if exitButton.contains(touchlocation){
            
            let gameScene = GameScene(fileNamed:"StartScreen")
            gameScene?.scaleMode = .aspectFill
            let reveal = SKTransition.fade(withDuration: 2)
            view!.presentScene(gameScene!, transition: reveal)
            
            
        }
        if greenDude.contains(touchlocation){
            
            if GameData.skinData.boughtSkins >= 1{
                selectArrow.position.y = greenDude.position.y
                  GameData.skinData.currentSkin = ("GreenDude")
            }
          
            
        }
        if blueDude.contains(touchlocation){
            if GameData.skinData.boughtSkins >= 2{
            selectArrow.position.y = blueDude.position.y
                 GameData.skinData.currentSkin = ("BlueDude")
            }
           
            
        }
        if shadesDude.contains(touchlocation){
            if GameData.skinData.boughtSkins >= 3{
            selectArrow.position.y = shadesDude.position.y
                GameData.skinData.currentSkin = ("ShadesDude")
            }
            
            
        }
        if usaDude.contains(touchlocation){
            if GameData.skinData.boughtSkins >= 4{
            selectArrow.position.y = usaDude.position.y
                GameData.skinData.currentSkin = ("USADude")
            }
            
            
        }
        if colorDude.contains(touchlocation){
            if GameData.skinData.boughtSkins >= 5{
            selectArrow.position.y = colorDude.position.y
                GameData.skinData.currentSkin = ("RainbowDude")
            }
            
            
        }
        if redDude.contains(touchlocation){
            if GameData.skinData.boughtSkins >= 0{
            selectArrow.position.y = redDude.position.y
                GameData.skinData.currentSkin = ("redDude")
            }
            
            
        }
        if buyButton.contains(touchlocation){
            print("hello")
            
            if GameData.playerData.money >= 100 {
                
                if GameData.skinData.boughtSkins == 0{
                    
                    lock1.removeFromParent()
                    greenDude.alpha = 1
                    GameData.skinData.boughtSkins = 1
                    GameData.playerData.money -= 100
                    
                }else if GameData.skinData.boughtSkins == 1{
                    
                    lock1.removeFromParent()
                    greenDude.alpha = 1
                    lock2.removeFromParent()
                    blueDude.alpha = 1
                    GameData.skinData.boughtSkins = 2
                    GameData.playerData.money -= 100
                    
                }else if GameData.skinData.boughtSkins == 2{
                    
                    lock1.removeFromParent()
                    greenDude.alpha = 1
                    lock2.removeFromParent()
                    blueDude.alpha = 1
                    lock3.removeFromParent()
                    shadesDude.alpha = 1
                    GameData.skinData.boughtSkins = 3
                    GameData.playerData.money -= 100
                    
                }else if GameData.skinData.boughtSkins == 3{
                    
                    lock1.removeFromParent()
                    greenDude.alpha = 1
                    lock2.removeFromParent()
                    blueDude.alpha = 1
                    lock3.removeFromParent()
                    shadesDude.alpha = 1
                    lock4.removeFromParent()
                    usaDude.alpha = 1
                    GameData.skinData.boughtSkins = 4
                    GameData.playerData.money -= 100
                    
                }else if GameData.skinData.boughtSkins == 4{
                    
                    lock1.removeFromParent()
                    greenDude.alpha = 1
                    lock2.removeFromParent()
                    blueDude.alpha = 1
                    lock3.removeFromParent()
                    shadesDude.alpha = 1
                    lock4.removeFromParent()
                    usaDude.alpha = 1
                    lock5.removeFromParent()
                    colorDude.alpha = 1
                    GameData.skinData.boughtSkins = 5
                    GameData.playerData.money -= 100
                    
                }else{
                    print("you already bought all the skins you gamer")
                }
                
        moneyLabel.text = ("\(GameData.playerData.money)")
                 UserDefaults.standard.set(GameData.playerData.money, forKey: "money")
                 UserDefaults.standard.set(GameData.skinData.boughtSkins, forKey: "skins")
}



}
}
}
