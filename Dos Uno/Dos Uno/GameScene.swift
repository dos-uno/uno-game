//
//  GameScene.swift
//  Dos Uno
//
//  Created by Rachael Worthington on 2/2/16.
//  Copyright (c) 2016 Purplellamas. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        // Set background color of game board
        self.backgroundColor = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1)
        
        let redZeroSprite = SKSpriteNode(imageNamed:"red0")
        
        redZeroSprite.xScale = 0.2
        redZeroSprite.yScale = 0.2
        redZeroSprite.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        
        
        self.addChild(redZeroSprite)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        // default template sprite action
        /*
        for touch in touches {
            let location = touch.locationInNode(self)
        
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))

            
            self.addChild(sprite)
        }
        */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
