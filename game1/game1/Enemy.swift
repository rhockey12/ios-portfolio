//
//  Enemy.swift
//  game1
//
//  Created by 90303405 on 10/9/18.
//  Copyright © 2018 Ryan Thomas. All rights reserved.
//

import Foundation
import SpriteKit


class Enemy{
    
    
    var Sprite: SKSpriteNode
    var speed: Int
    init(sprite: SKSpriteNode){
        self.Sprite = sprite
        self.speed = 15
       
        self.Sprite.physicsBody = SKPhysicsBody(rectangleOf: self.Sprite.size)
        self.Sprite.physicsBody?.affectedByGravity = false
        self.Sprite.physicsBody?.categoryBitMask = GameScene.PhysicsCategory.enemy
         self.Sprite.physicsBody?.contactTestBitMask = GameScene.PhysicsCategory.dude
         //self.Sprite.physicsBody?.collisionBitMask = GameScene.PhysicsCategory.dude
        
        
        
    }
    
    
}




