//
//  GameScene.swift
//  bubbles
//
//  Created by Kendra Mosley on 12/2/18.
//  Copyright © 2018 Kendra Mosley. All rights reserved.
import SpriteKit
import GameplayKit
import UIKit


class GameScene: SKScene {
    
    //CLASS VARIABLES
    var score: Int = 0;
    var points = 0
    let bubbleColor = UIColor(hue: CGFloat.random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
    let bubbleSize = CGSize(width: 30, height: 30)
    var currentGameState: GameState = .gameStart
    var gameCounter = 0
    let gameSpeed = Double(Int.random(in: 1...25))
    var pointsLabel = ScoreLabel(text: "Score: 0", fontColor: UIColor.purple, fontSize: 30, fontName: "Marker Felt")
    
    
    
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.white
        displayLabel()
        let wait = SKAction.wait(forDuration: 5)
        let start = SKAction.run {
              self.makeBubble()
        }
        let startGame = SKAction.sequence([wait, start])
        let repeatBubble = SKAction.repeatForever(startGame)
        self.run(repeatBubble)
        
    }
    
    // Function to update the status of the game
    override func update(_ currentTime: TimeInterval) {
        
        // the game is not running...
        if currentGameState != .gameStart { return }
        if gameCounter <= 0 {
            makeBubble()
            gameCounter = 15 * Int.random(in: 1...4)
        }else {
            gameCounter -= 1
        }
    }
    
    // Function to handle events when the bubbles are being poped
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == .gameOver{
            
            if let view = self.view{
                currentGameState = .gameOver
                let scene = GameScene(size: view.bounds.size)
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
                view.ignoresSiblingOrder = false
            }
        }else if currentGameState == .gameStart {
            if let touch = touches.first {
                let touchedBubble = self.atPoint(touch.location(in: self))
                if touchedBubble.name == "bubble"{
                    touchedBubble.removeFromParent()
                    points += 1
                    updatePointLabel()
                }
            }
            
        }
    }
    
    
    // this function creates a single bubble
    func makeBubble(){
        
        //_ = UIColor(hue: CGFloat.random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
        let bubble = Bubble(name: "bubble", radius: 20, color: bubbleColor, screenSize: self.size)
        addChild(bubble)
        moveBubbleToTop(bubble: bubble)
    }
    
    // Function to set up the label on the screen
    func displayLabel(){
        
        let position = CGPoint(x: (self.size.width/2), y: (self.size.height - 80))
        pointsLabel.position = position
        addChild(pointsLabel)
    }
    
    
    // Function to set up the game over label
    func setUpGameOverLabel(){
        
        let gameOverLabel = SKLabelNode()
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontColor = UIColor.purple
        gameOverLabel.fontName = "Marker Felt"
        gameOverLabel.fontSize = 50
        gameOverLabel.position = CGPoint(x: (self.size.width/2), y: (self.size.height/2))
        
        addChild(gameOverLabel)
    }
    
    
    // Function to update the score label
    func updatePointLabel(){
        
        if points < 0{
            gameOver()
        }else{
            updatePoints(points: points)
        }
    }
    
    
    //Function to move the bubble class
    func moveBubbleToTop(bubble: SKShapeNode){
        
        let moveBubbleUp = SKAction.moveTo(y: size.height, duration: 5.0)
        let sequence = SKAction.sequence([moveBubbleUp, .removeFromParent()])
        
        bubble.run(sequence){
            self.points -= 1
            self.updatePointLabel()
        }
    }
    
    // Function to update the user points on the screen
    func updatePoints(points: Int){
        pointsLabel.text = "Score : \(points)"
    }
    
    
    // Function to handle events when the game is over
    func gameOver(){
        
        currentGameState = .gameOver
        removeFromParent()
        setUpGameOverLabel()
    }
    
}
