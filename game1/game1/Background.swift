//
//  Background.swift
//  game1
//
//  Created by 90303405 on 1/16/19.
//  Copyright © 2019 Ryan Thomas. All rights reserved.
//

import Foundation

import SpriteKit


class Background{
    
    
    var Sprite: SKSpriteNode
    var speed: Int
    init(sprite: SKSpriteNode){
        self.Sprite = sprite
        self.speed = 5
        self.Sprite.name = ("Background")
    }
    
}
