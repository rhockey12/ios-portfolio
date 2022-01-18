//
//  Money.swift
//  game1
//
//  Created by 90303405 on 10/9/18.
//  Copyright © 2018 Ryan Thomas. All rights reserved.
//

import Foundation
import SpriteKit


class Money{
    
    
    var Sprite: SKSpriteNode
    var speed: Int
    var hasTouched: Bool
    init(sprite: SKSpriteNode){
        self.Sprite = sprite
        self.speed = 20
        self.hasTouched = false
        self.Sprite.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        self.Sprite.physicsBody?.categoryBitMask = GameScene.PhysicsCategory.money
        self.Sprite.physicsBody?.contactTestBitMask = GameScene.PhysicsCategory.dude
      //  self.Sprite.physicsBody?.collisionBitMask = GameScene.PhysicsCategory.dude
        self.Sprite.physicsBody?.affectedByGravity = false
        self.Sprite.name = ("money")
    }
    
}
