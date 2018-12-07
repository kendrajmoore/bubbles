//
//  Bubble.swift
//  bubbles
//
//  Created by Kendra Mosley on 12/3/18.
//  Copyright © 2018 Kendra Mosley. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Bubble: SKShapeNode{
    
    
    override init(){
        super.init()
    }
    
    convenience init(name: String, radius: CGFloat, color: UIColor, screenSize: CGSize) {
        
        //self.init()
        self.init(circleOfRadius: radius)
        self.fillColor = getRandomColor()
        self.name = name
        setUp(screenWidth: screenSize.width)
    }
    
    
    func setUp(screenWidth: CGFloat){
        
        let x = Int.random(in: 20...Int(screenWidth - 20))
        self.position = CGPoint(x: x, y: 0)
    }
    
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

