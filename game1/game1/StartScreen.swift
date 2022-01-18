//
//  StartScreen.swift
//  game1
//
//  Created by 90303405 on 10/23/18.
//  Copyright © 2018 Ryan Thomas. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit


class StartScreen: SKScene{
    
    var button: SKSpriteNode!
    var shopButton: SKSpriteNode!
    var skinDisplay: SKSpriteNode!
    override func sceneDidLoad() {
        
        if let x = UserDefaults.standard.object(forKey: "money") {
            GameData.playerData.money = x as! Int
        }
        if let y = UserDefaults.standard.object(forKey: "skins") {
            GameData.skinData.boughtSkins = y as! Int
        }
        if let z = UserDefaults.standard.object(forKey: "currentSkin") {
            GameData.skinData.currentSkin = z as! String
        }
        let cashMoney = SKLabelNode(text: "\(GameData.playerData.money)")
        cashMoney.fontName = ("Menlo-Bold")
        cashMoney.fontSize = 70
        cashMoney.fontColor = SKColor.white
        cashMoney.position = CGPoint(x: frame.midX, y: frame.midY + 220)
        cashMoney.zPosition = CGFloat(1000)
        addChild(cashMoney)
        
        guard let sprite = childNode(withName: "SKSpriteNode") as? SKSpriteNode else{
            fatalError()
        }
        button = sprite
        guard let sprite2 = childNode(withName: "shopButton") as? SKSpriteNode else{
            fatalError()
        }
        shopButton = sprite2
        guard let sprite3 = childNode(withName: "currentSkin") as? SKSpriteNode else{
            fatalError()
        }
        skinDisplay = sprite3
        
        skinDisplay.texture = SKTexture(imageNamed: "\(GameData.skinData.currentSkin)")
        
    }
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchlocation = touch.location(in: self)
        if button.contains(touchlocation){
            let gameScene = GameScene(fileNamed:"GameScene")
            gameScene?.scaleMode = .aspectFill
            let reveal = SKTransition.fade(withDuration: 2)
            view!.presentScene(gameScene!, transition: reveal)
          
        }
        if shopButton.contains(touchlocation){
            let gameScene = GameScene(fileNamed:"ShopScreen")
            gameScene?.scaleMode = .aspectFill
            let reveal = SKTransition.fade(withDuration: 2)
            view!.presentScene(gameScene!, transition: reveal)
        }
    }
    
    
    
}

