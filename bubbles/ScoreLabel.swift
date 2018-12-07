//
//  ScoreLabel.swift
//  bubbles
//
//  Created by Kendra Mosley on 12/2/18.
//  Copyright © 2018 Kendra Mosley. All rights reserved.
//

import Foundation
import SpriteKit

class ScoreLabel: SKLabelNode{
    
    var Score = 0
    
    init(text: String, fontColor: UIColor, fontSize: CGFloat, fontName: String){
        
        super.init()
        self.text = text
        self.fontColor = fontColor
        self.fontName = fontName
        self.fontSize = fontSize
        //self.position = position
    }
    
    /* Function to update the score board
     @param points: The current points of the player
     */
    func updateScore(points: Int){
        Score += points
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
