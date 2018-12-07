//
//  GameViewController.swift
//  bubbles
//
//  Created by Kendra Mosley on 12/2/18.
//  Copyright © 2018 Kendra Mosley. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up our view to present our game
        guard let view = self.view as? SKView else {return}
        
        // set up our game scene
        let gameScene = GameScene(size: self.view.frame.size)
        gameScene.scaleMode = .aspectFit
        
        // present our game scene
        view.presentScene(gameScene)
        
        // display debug info
        view.showsFPS = true
        view.showsNodeCount = true
        
        
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
