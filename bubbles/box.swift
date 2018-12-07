//
//  box.swift
//  bubbles
//
//  Created by Kendra Mosley on 12/2/18.
//  Copyright © 2018 Kendra Mosley. All rights reserved.
//

import UIKit
import SpriteKit

class Box: SKSpriteNode {
    init() {
        let boxSize = CGSize(width: 300, height: 300)
        super.init(texture: SKTexture(imageNamed: "kanye-west-face-png-6.png"), color: .red, size: boxSize)
        name = "box"
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
