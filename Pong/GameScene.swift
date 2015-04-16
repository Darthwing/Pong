//
//  GameScene.swift
//  Pong
//
//  Created by Peter Regard on 4/9/15.
//  Copyright (c) 2015 Eggs Enterprises. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var timer = NSTimer()

    var ball = SKSpriteNode()
    var ballTexture = SKTexture(imageNamed: "Ball.png")
    
    var paddle = SKSpriteNode()
    var paddleTexture = SKTexture(imageNamed: "PongPaddle.png")
    
    var paddle2 = SKSpriteNode()
    
    var background = SKSpriteNode()
    var bgTexture = SKTexture(imageNamed: "bg.png")
    
    var wall1 = SKSpriteNode()
    var wall2 = SKSpriteNode()
    var wallTexture = SKTexture(imageNamed: "wall1.png")
    
    
    var ballBit:UInt32 = 1
    var scoreBit:UInt32 = 2
    var scoreBit2:UInt32 = 4
    
    var count = 0
    var play = 0
    var scoreP1 = 0
    var scoreP2 = 0
    
    var welcome = SKLabelNode()
    var instructions = SKLabelNode()
    var instructions2 = SKLabelNode()
    var start = SKLabelNode()
    var P1 = SKLabelNode()
    var P2 = SKLabelNode()
    
    var scoreWall1 = SKNode()
    var scoreWall2 = SKNode()
    
    var words = SKNode()
    
    
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.addChild(words)
        
        /* Setup your scene here */
        //        __________________________________________________________________
        //        MARK:Background
        
        background = SKSpriteNode(texture: bgTexture)
        background.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.addChild(background)
        background.zPosition = 1
        
        //        __________________________________________________________________
        //        MARK:Words
        
        welcome.text = "Pong"
        welcome.fontName = "PressStart2P"
        welcome.fontColor = NSColor.redColor()
        welcome.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-200)
        welcome.fontSize = 50
        welcome.zPosition = 15
        words.addChild(welcome)
        
        instructions.text = "Player1 Uses 'Up-arrow' and 'Down-arrow' "
        instructions.fontName = "PressStart2P"
        instructions.fontColor = NSColor.redColor()
        instructions.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-400)
        instructions.fontSize = 25
        instructions.zPosition = 15
        words.addChild(instructions)
        
        instructions2.text = " Player2 Uses 'W' and 'S' "
        instructions2.fontName = "PressStart2P"
        instructions2.fontColor = NSColor.redColor()
        instructions2.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-500)
        instructions2.fontSize = 25
        instructions2.zPosition = 15
        words.addChild(instructions2)
        
        start.text = "Press Enter"
        start.fontName = "PressStart2P"
        start.fontColor = NSColor.yellowColor()
        start.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame)-200)
        start.fontSize = 50
        start.zPosition = 15
        words.addChild(start)

        
        
        
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
        
        
        
        
    }
     override func keyDown(theEvent: NSEvent) {
        if theEvent.keyCode == 126{if count == 0 {paddle.physicsBody?.velocity = CGVector(dx: 0, dy: 750)}; count++}
        if theEvent.keyCode == 125{if count == 0{paddle.physicsBody?.velocity = CGVector(dx: 0, dy: -750)}; count++}
        if theEvent.keyCode == 13{if count == 0{paddle2.physicsBody?.velocity = CGVector(dx: 0, dy: 750)}; count++}
        if theEvent.keyCode == 1{if count == 0{paddle2.physicsBody?.velocity = CGVector(dx: 0, dy: -750)}; count++}
        if theEvent.keyCode == 49{ball.physicsBody?.applyImpulse(CGVector(dx: 3, dy: 4))}
        
        
    }
    
    override func keyUp(theEvent: NSEvent) {
        if theEvent.keyCode == 126{paddle.physicsBody?.velocity = CGVector(dx: 0, dy: 0); count = 0}
        if theEvent.keyCode == 125{paddle.physicsBody?.velocity = CGVector(dx: 0, dy: 0); count = 0}
        if theEvent.keyCode == 13{paddle2.physicsBody?.velocity = CGVector(dx: 0, dy: 0); count = 0}
        if theEvent.keyCode == 1{paddle2.physicsBody?.velocity = CGVector(dx: 0, dy: 0);count = 0}
        if theEvent.keyCode == 36{if play == 0{
            words.removeAllChildren()
            
            //       ___________________________________________________________
            //        MARK:Ball
            
            
            ball = SKSpriteNode(texture: ballTexture)
            ball.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(15, 15))
            ball.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
            ball.physicsBody?.linearDamping = 0
            ball.zPosition = 10
            ball.physicsBody?.restitution = 1
            ball.physicsBody?.allowsRotation = false
            ball.physicsBody?.categoryBitMask = ballBit
            ball.physicsBody?.contactTestBitMask = ballBit
            ball.physicsBody?.collisionBitMask = ballBit
            
            
            self.addChild(ball)
            
            //       ___________________________________________________________
            //        MARK:Paddle1
            paddle = SKSpriteNode(texture: paddleTexture)
            paddle.position = CGPoint(x: CGRectGetMaxX(self.frame)-50, y: CGRectGetMidY(self.frame))
            paddle.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(22, 175))
            paddle.physicsBody?.dynamic = true
            paddle.physicsBody?.mass = 1000000
            paddle.physicsBody?.linearDamping = 0
            paddle.physicsBody?.restitution = 0
            paddle.physicsBody?.friction = 0
            self.addChild(paddle)
            paddle.zPosition = 2
            
            
            //       ___________________________________________________________
            //        MARK:Paddle2
            paddle2 = SKSpriteNode(texture: paddleTexture)
            paddle2.position = CGPoint(x: CGRectGetMinX(self.frame)+50, y: CGRectGetMidY(self.frame))
            paddle2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(22, 175))
            paddle2.physicsBody?.dynamic = true
            paddle2.physicsBody?.mass = 1000000
            paddle.physicsBody?.linearDamping = 0
            paddle2.physicsBody?.restitution = 0
            paddle2.physicsBody?.friction = 0
            self.addChild(paddle2)
            paddle2.zPosition = 2
            
            
            
            //       _________________________________________________________________________________
            //        MARK: Walls
            wall1 = SKSpriteNode(texture: wallTexture)
            wall1.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1280, 45))
            wall1.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-17)
            wall1.physicsBody?.dynamic = false
            wall1.zPosition = 10
            wall1.physicsBody?.restitution = 0
            wall1.physicsBody?.friction = 0
            self.addChild(wall1)
            
            wall2 = SKSpriteNode(texture: wallTexture)
            wall2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1280, 45))
            wall2.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMinY(self.frame)+17)
            wall2.physicsBody?.dynamic = false
            wall2.zPosition = 10
            wall2.physicsBody?.restitution = 0
            wall2.physicsBody?.friction = 0
            self.addChild(wall2)
            
            
//       _________________________________________________________________________________
//        MARK: Scoring
            
            scoreWall1.position = CGPoint(x: CGRectGetMaxX(self.frame), y: CGRectGetMidY(self.frame))
            scoreWall1.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1, 1280))
            scoreWall1.physicsBody?.dynamic = false
            scoreWall1.physicsBody?.categoryBitMask = scoreBit
            scoreWall1.physicsBody?.contactTestBitMask = ballBit
            scoreWall1.physicsBody?.collisionBitMask = ballBit
            self.addChild(scoreWall1)
            
            scoreWall2.position = CGPoint(x: CGRectGetMinX(self.frame), y: CGRectGetMidY(self.frame))
            scoreWall2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1, 1280))
            scoreWall2.physicsBody?.dynamic = false
            scoreWall2.physicsBody?.categoryBitMask = scoreBit2
            scoreWall2.physicsBody?.contactTestBitMask = ballBit
            scoreWall2.physicsBody?.collisionBitMask = ballBit
            self.addChild(scoreWall2)
            
            Scoring()
            
            
            
            
           play++ }
}
        

        
    }
    func didBeginContact(contact: SKPhysicsContact) {
        
        println(contact.bodyA.categoryBitMask)
        println(contact.bodyB.categoryBitMask)
        
        if contact.bodyA.categoryBitMask == ballBit && contact.bodyB.categoryBitMask == scoreBit{
            scoreP2++
            ball.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
//            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
//            ball.physicsBody?.applyImpulse(CGVector(dx: 3, dy: 4))
            ball.zPosition = 11
            Scoring()}
        
        if contact.bodyA.categoryBitMask == ballBit && contact.bodyB.categoryBitMask == scoreBit2{
            scoreP1++
            ball.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
            ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
//            ball.physicsBody?.applyImpulse(CGVector(dx: -3, dy: 4))
            ball.zPosition = 11
            Scoring()}

        
            
        
    }
    
    func Scoring(){
        P1.removeFromParent()
        P1.text = String(scoreP1)
        P1.fontName = "PressStart2P"
        P1.fontColor = NSColor.redColor()
        P1.position = CGPoint(x: CGRectGetMidX(self.frame)+200, y: CGRectGetMaxY(self.frame)-400)
        P1.fontSize = 75
        P1.zPosition = 15
        self.addChild(P1)
        
        P2.removeFromParent()
        P2.text = String(scoreP2)
        P2.fontName = "PressStart2P"
        P2.fontColor = NSColor.redColor()
        P2.position = CGPoint(x: CGRectGetMidX(self.frame)-200, y: CGRectGetMaxY(self.frame)-400)
        P2.fontSize = 75
        P2.zPosition = 15
        self.addChild(P2)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
