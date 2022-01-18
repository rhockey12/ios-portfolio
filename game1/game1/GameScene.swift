//
//  GameScene.swift
//  game1
//
//  Created by 90303405 on 10/8/18.
//  Copyright © 2018 Ryan Thomas. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation



class GameScene: SKScene, SKPhysicsContactDelegate {
   
    
    //  V dis my vars V
    var moneyArray: [Money] = []
    var Dude: SKSpriteNode!
    var enemyArray: [Enemy] = []
    var spaceArray: [Background] = []
    var startOverBtn = SKLabelNode(fontNamed: "Melo-Bold")
    var bigBuzz = UIImpactFeedbackGenerator(style: .heavy)
    var death = 0
    var backgroundPlayer = AVAudioPlayer()
    var gameOverBtn : SKShapeNode!
    var mainMenuBtn : SKShapeNode!
    var mainMenuLabel: SKLabelNode!
    var gameOverLabel : SKLabelNode!
    var playAgain : SKLabelNode!
    var dudeSpeed = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var scoreLabel = SKLabelNode(text: "0")
    var dudeTexture: SKTexture!
    var difficulty: TimeInterval = 1.0
    // ^ dis my vars ^
    
    
    struct PhysicsCategory{
        static let enemy : UInt32 = 1
        static let dude : UInt32 = 0
        static let money : UInt32 = 2
    }
    
    
    
    override func sceneDidLoad() {
        guard let SpriteNode = childNode(withName: "Dude") as? SKSpriteNode else {
            fatalError("Sprite Not Load")
        }

        self.Dude = SpriteNode
        self.Dude.name = "dude"
        let dudeTexture = SKTexture(imageNamed: "\(GameData.skinData.currentSkin)")
        self.Dude.texture = dudeTexture
        self.Dude.physicsBody = SKPhysicsBody(texture: self.Dude.texture!, size: CGSize(width: Dude.size.width, height: Dude.size.height))
        self.Dude.physicsBody?.affectedByGravity = false
        self.Dude.physicsBody?.categoryBitMask = PhysicsCategory.dude
        self.Dude.physicsBody?.contactTestBitMask = PhysicsCategory.enemy | PhysicsCategory.money
       // self.Dude.physicsBody?.collisionBitMask = PhysicsCategory.enemy | PhysicsCategory.money
        self.Dude.physicsBody?.allowsRotation = false
        self.Dude.physicsBody?.isDynamic = false
//         run(SKAction.repeat(SKAction.sequence([SKAction.run(spawnEnemy), SKAction.wait(forDuration: difficulty)]), count: Int(UINT32_MAX)))
        
        run(SKAction.repeat(SKAction.sequence([SKAction.run(spawnMoney), SKAction.wait(forDuration: 4.5)]), count: Int(UINT32_MAX)))
        
         run(SKAction.repeat(SKAction.sequence([SKAction.run(addDifficulty), SKAction.wait(forDuration: 7.0)]), count: Int(UINT32_MAX)))
         run(SKAction.repeat(SKAction.sequence([SKAction.run(spawnBackground), SKAction.wait(forDuration: 3)]), count: Int(UINT32_MAX)))
        if GameData.playerData.playMusic == 0{
       playBackgroundMusic(filenamed: "GameBackground.wav")
            GameData.playerData.playMusic = 1
        }
        scoreLabel = SKLabelNode(fontNamed: "Menlo-Bold")
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: -260, y: 560)
        scoreLabel.zPosition = CGFloat(1000)
       
       
        
       
        
        addChild(scoreLabel)
    }
    
    func playBackgroundMusic(filenamed: String){
        
        let url = Bundle.main.url(forResource: filenamed, withExtension: nil)
        guard let newUrl = url else{
            
            print ("Could not find file called \(filenamed)")
            return
        }
        do {
            
            backgroundPlayer = try AVAudioPlayer(contentsOf: newUrl)
            backgroundPlayer.numberOfLoops = -1
            backgroundPlayer.prepareToPlay()
            backgroundPlayer.play()
        }
        catch let error as NSError {
            print (error.description)
            
        }
    }
    
    func gameOver() {
        UserDefaults.standard.set(GameData.playerData.money, forKey: "money")
        death = 1
        bigBuzz.impactOccurred()
        Dude.removeFromParent()
        gameOverLabel = SKLabelNode(fontNamed: "Menlo-Bold")
        gameOverLabel.text = ("Game Over")
        gameOverLabel.fontSize = 60
        gameOverLabel.fontColor = SKColor.red
        gameOverLabel.position = CGPoint(x: frame.midX, y: frame.midY + 150)
        gameOverLabel.zPosition = CGFloat(1000)
        addChild(gameOverLabel)
        
        playAgain = SKLabelNode(fontNamed: "Menlo-Bold")
        playAgain.text = ("Play Again")
        playAgain.fontSize = 45
        playAgain.fontColor = SKColor.white
        playAgain.position = CGPoint(x: frame.midX - 5, y: frame.midY - 20)
        playAgain.zPosition = CGFloat(1000)
        addChild(playAgain)
        let size = CGSize(width: 320, height: 125)
        gameOverBtn = SKShapeNode(rectOf: size, cornerRadius: 25)
        gameOverBtn.name = "StartOver"
        gameOverBtn.fillColor = SKColor.red
        gameOverBtn.position = CGPoint(x: frame.midX, y: frame.midY)
        gameOverBtn.zPosition = CGFloat(1000)
        addChild(gameOverBtn)
        
        mainMenuBtn = SKShapeNode(rectOf: size, cornerRadius: 25)
        mainMenuBtn.name = "StartOver"
        mainMenuBtn.fillColor = SKColor.red
        mainMenuBtn.position = CGPoint(x: frame.midX, y: frame.midY - 150)
        mainMenuBtn.zPosition = CGFloat(1000)
        addChild(mainMenuBtn)
        
        mainMenuLabel = SKLabelNode(fontNamed: "Menlo-Bold")
        mainMenuLabel.text = ("Menu")
        mainMenuLabel.fontColor = SKColor.white
        mainMenuLabel.fontSize = 45
        mainMenuLabel.position = CGPoint(x: frame.midX, y: frame.midY - 175)
        mainMenuLabel.zPosition = CGFloat(1000)
        addChild(mainMenuLabel)
        
        
        
    }
    
    
    
    
    
    func spawnEnemy() {
        let enemy = Enemy(sprite: SKSpriteNode())
        let enemyPic = arc4random_uniform(5)
        let newTexture = SKTexture(imageNamed: "\(enemyPic).png")
//        let rectangularEnemy = SKSpriteNode(texture: newTexture)
//        rectangularEnemy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: rectangularEnemy.size.width, height: rectangularEnemy.size.height))
        enemy.Sprite.size = CGSize(width: 200, height: 200)
        enemy.Sprite.physicsBody = SKPhysicsBody(texture: newTexture, size: CGSize(width: enemy.Sprite.size.width, height: enemy.Sprite.size.height))
         enemy.Sprite.physicsBody?.affectedByGravity = false
        let xcoordinate = Int.random(in: -320..<320)
        enemy.Sprite.name = "enemy"
        addChild(enemy.Sprite)
        enemy.Sprite.texture = newTexture
        enemyArray.append(enemy)
        enemy.Sprite.position = CGPoint(x: xcoordinate, y: 800)
        enemy.Sprite.physicsBody?.allowsRotation = false
        
    }
    
    func spawnMoney() {
        let money = Money(sprite: SKSpriteNode(imageNamed: "Money"))
        money.Sprite.size = CGSize(width: 200, height: 200)
        let xcoordinate = Int.random(in: -320..<320)
        addChild(money.Sprite)
        money.Sprite.name = "money"
        moneyArray.append(money)
        money.Sprite.physicsBody?.allowsRotation = false
        money.Sprite.position = CGPoint(x: xcoordinate, y: 800)
        
        
    }
    func spawnBackground() {
        let space = Background(sprite: SKSpriteNode(imageNamed: "SpaceBack"))
        space.Sprite.size = CGSize(width: 750, height: 1334)
        space.Sprite.name = "Background"
        spaceArray.append(space)
        space.Sprite.position = CGPoint(x: 0, y: 1500)
        addChild(space.Sprite)
        
    }
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        
        // Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    func didBegin( _ contact: SKPhysicsContact) {
        let objectA = contact.bodyA.node as! SKSpriteNode
        let objectB = contact.bodyB.node as! SKSpriteNode
        
        print("objectA name: \(String(describing: objectA.name))")
        print("objectB name: \(String(describing: objectB.name))")
        
    if objectA.name == "dude" && objectB.name == "enemy"{
            
        for enemy in enemyArray{
            enemy.Sprite.removeFromParent()
            
        }
        self.removeAllChildren()
                gameOver()
        
            
    }else if objectA.name == "enemy" && objectB.name == "dude"{
        for enemy in enemyArray{
            enemy.Sprite.removeFromParent()
            
        }
        self.removeAllChildren()
        gameOver()
        
    }
    if objectA.name == "dude" && objectB.name == "money"{
        
        for money in moneyArray{
            if money.hasTouched == false && objectB == money.Sprite {
                money.hasTouched = true
                money.Sprite.removeFromParent()
                GameData.playerData.money += 1
                print ("money")
                print ("\(GameData.playerData.money)")
            }
            
            
        }
    }else if objectA.name == "money" && objectB.name == "dude" {
        for money in moneyArray{
            if money.hasTouched == false && objectA == money.Sprite {
                money.hasTouched = true
                money.Sprite.removeFromParent()
                GameData.playerData.money += 1
                print ("money")
                print ("\(GameData.playerData.money)")
            }
            
            
        }
//        for money in moneyArray{
//            money.Sprite.removeFromParent()
//        }
//            GameData.playerData.money += 1
//            print ("money")
//            print ("\(GameData.playerData.money)")


    }
    
        
    }
    
    func addDifficulty(){

   // difficulty += 1
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchlocation = touch.location(in: self)
        
       
        if touchlocation.x < 0 {
            if dudeSpeed == 0{
          
            }
            dudeSpeed = -15
            
            
        }else{
            if dudeSpeed == 0{
           
            }
            dudeSpeed = 15
            
            
            
        }
        if death == 1{
            
            if gameOverBtn.contains(touchlocation) {
                gameOverLabel.removeFromParent()
                playAgain.removeFromParent()
                mainMenuBtn.removeFromParent()
                mainMenuLabel.removeFromParent()
                gameOverBtn.removeFromParent()
                addChild(Dude)
                death = 0
                addChild(scoreLabel)
            }else{
                print ("bleh")
            }
            if mainMenuBtn.contains(touchlocation){
                let gameScene = GameScene(fileNamed:"StartScreen")
                gameScene?.scaleMode = .aspectFill
                let reveal = SKTransition.fade(withDuration: 2)
                view!.presentScene(gameScene!, transition: reveal)
            }
           
        }
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
        dudeSpeed = 0
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    var lastUpdateTime: TimeInterval = 0
    var currentUpdateTimeDiff: TimeInterval = 0
    var currentUpdateTimeSpawn: TimeInterval = 0
    override func update(_ currentTime: TimeInterval) {
        
        currentUpdateTimeDiff += currentTime - lastUpdateTime
        if currentUpdateTimeDiff >= TimeInterval(5){
            currentUpdateTimeDiff = 0
            if difficulty >= 0.5 {
                difficulty -= 0.05
            }
            
            
        }
        currentUpdateTimeSpawn += currentTime - lastUpdateTime
        if currentUpdateTimeSpawn >= difficulty{
            print(currentUpdateTimeSpawn)
            currentUpdateTimeSpawn = 0
            spawnEnemy()
            
            
        }
        
        lastUpdateTime = currentTime
        scoreLabel.text = ("\(GameData.playerData.money)")
        
        
        if Dude.position.x <= -280{
            dudeSpeed = 0
             Dude.position.x += 1
            
            
        }
        if Dude.position.x >= 300{
            dudeSpeed = 0
            Dude.position.x -= 1
            
            
        }
        
        for enemy in enemyArray{
            enemy.Sprite.zPosition = CGFloat(2)
            enemy.Sprite.position.y -= CGFloat(enemy.speed)
            
            if enemy.Sprite.position.y <= -720{
                enemy.Sprite.removeFromParent()
            }
            
        }
        for space in spaceArray{
            space.Sprite.zPosition = CGFloat(1)
            space.Sprite.position.y -= CGFloat(space.speed)
            if space.Sprite.position.y <= -1000{
                space.Sprite.removeFromParent()
            }
        }
        Dude.position.x += CGFloat(dudeSpeed)
        for money in moneyArray{
            money.Sprite.zPosition = CGFloat(2)
            money.Sprite.position.y -= CGFloat(money.speed)
            if money.Sprite.position.y <= -720{
                money.Sprite.removeFromParent()
            }
        }
       
        
        
    }
}
