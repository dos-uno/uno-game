//
//  GameScene.swift
//  Dos Uno
//
//  Created by Rachael Worthington on 2/2/16.
//  Copyright (c) 2016 Purplellamas. All rights reserved.
//

import SpriteKit

class CardSprite: SKSpriteNode {
    var card: Card?
}

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
