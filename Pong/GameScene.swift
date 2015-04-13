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
    
    var wallBit:UInt32 = 1
    var ballBit = 3
    var scoreBit = 5
    
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        /* Setup your scene here */
        
        
        
//       ___________________________________________________________
//        MARK:Ball
        
        
        ball = SKSpriteNode(texture: ballTexture)
        ball.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(15, 15))
        ball.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        ball.physicsBody?.linearDamping = 0
        ball.zPosition = 10
        ball.physicsBody?.restitution = 1
        ball.physicsBody?.allowsRotation = false
        
       
        self.addChild(ball)
        
//       ___________________________________________________________
//        MARK:Paddle1
        paddle = SKSpriteNode(texture: paddleTexture)
        paddle.position = CGPoint(x: CGRectGetMaxX(self.frame)-50, y: CGRectGetMidY(self.frame))
        paddle.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(22, 175))
        paddle.physicsBody?.dynamic = false
        self.addChild(paddle)
        paddle.zPosition = 2
        
        
        //       ___________________________________________________________
        //        MARK:Paddle2
        paddle2 = SKSpriteNode(texture: paddleTexture)
        paddle2.position = CGPoint(x: CGRectGetMinX(self.frame)+50, y: CGRectGetMidY(self.frame))
        paddle2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(22, 175))
        paddle2.physicsBody?.dynamic = false
        self.addChild(paddle2)
        paddle2.zPosition = 2
        
//        __________________________________________________________________
//        MARK:Background
        
        background = SKSpriteNode(texture: bgTexture)
        background.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.addChild(background)
        background.zPosition = 1
   
//       _________________________________________________________________________________
//        MARK: Walls
        wall1 = SKSpriteNode(texture: wallTexture)
        wall1.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1280, 45))
        wall1.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame)-17)
        wall1.physicsBody?.dynamic = false
        wall1.zPosition = 10
        wall1.physicsBody?.restitution = 1
        wall1.physicsBody?.friction = 0
        self.addChild(wall1)
        
        wall2 = SKSpriteNode(texture: wallTexture)
        wall2.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(1280, 45))
        wall2.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMinY(self.frame)+17)
        wall2.physicsBody?.dynamic = false
        wall2.zPosition = 10
        wall2.physicsBody?.restitution = 1
        wall2.physicsBody?.friction = 0
        self.addChild(wall2)
        
        
    }
    
    override func mouseDown(theEvent: NSEvent) {
        /* Called when a mouse click occurs */
        
        
    }
    override func keyDown(theEvent: NSEvent) {
        if theEvent.keyCode == 126{paddle.position.y = paddle.position.y + 30}
        if theEvent.keyCode == 125{paddle.position.y = paddle.position.y - 30}
        if theEvent.keyCode == 13{paddle2.position.y = paddle2.position.y + 30}
        if theEvent.keyCode == 1{paddle2.position.y = paddle2.position.y - 30}
        if theEvent.keyCode == 49{ball.physicsBody?.applyImpulse(CGVector(dx: 3, dy: 3))}
        
        
    }
    
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
