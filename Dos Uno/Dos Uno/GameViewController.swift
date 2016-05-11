//
//  GameViewController.swift
//  Dos Uno
//
//  Created by Rachael Worthington on 2/2/16.
//  Copyright (c) 2016 Purplellamas. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, SKSceneDelegate {
    // MARK: Properties
    @IBOutlet weak var drawPile: UIView!
    @IBOutlet weak var discardPile: UIView!
    @IBOutlet weak var challengeUnoButton: UIButton!
    @IBOutlet weak var declareUnoButton: UIButton!
    
    var scene: GameScene?
    var user:User
    var game:Game

    required init?(coder aDecoder: NSCoder) {
        user = User(name: "", score: 0, hand: [])
        game = Game(users:[user])
        game.newRound()
        super.init(coder: aDecoder)
    }
    

    // MARK: Implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        scene = GameScene(fileNamed:"GameScene")
        
        guard let scene = scene else {
            return 
        }

        scene.delegate = self
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
        scene.backgroundColor = UIColor(red:0.05, green:0.67, blue:0.15, alpha:1.00)
        
        updateHand()
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func challengeUnoAction(sender: UIButton) {
        
    }
    
    func updateHand() {
        var cardSprites: [SKSpriteNode] = []
        var position: Int = 0
        guard let scene = scene else {
            return
        }
        for card in user.hand {
            let cardName:String = "\(card.color)\(card.value)"
            cardSprites.append(SKSpriteNode(imageNamed:cardName))
        }
        for sprite in cardSprites {
            
            scene.addChild(sprite)
        }
    }
    

}
