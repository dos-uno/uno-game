//
//  GameViewController.swift
//  Dos Uno
//
//  Created by Rachael Worthington on 2/2/16.
//  Copyright (c) 2016 Purplellamas. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var drawPile: UIView!
    @IBOutlet weak var discardPile: UIView!
    @IBOutlet weak var challengeUnoButton: UIButton!
    @IBOutlet weak var declareUnoButton: UIButton!
    
    var scene: GameScene?
    
    // MARK: Implementation
    override func viewDidLoad() {
        super.viewDidLoad()
        scene = GameScene(fileNamed:"GameScene")
        
        if let localScene = scene {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            localScene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
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
}
