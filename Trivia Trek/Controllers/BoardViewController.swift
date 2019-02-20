//
//  BoardViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 1/27/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit
import GameKit

class BoardViewController: UIViewController {

    @IBOutlet weak var boardView: SKView!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var readyButton: UIButton!
    @IBOutlet weak var moveButton: UIButton!
    
    var game: Game?
    var isPaused: Bool = false
    var currentTurn: DispatchWorkItem?
    var currentTime: Double = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.quitButton.layer.cornerRadius = 7
        self.readyButton.layer.cornerRadius = 7
        self.moveButton.layer.cornerRadius = 7
        
        self.currentTime = 0
        
        self.game!.initBackground(size: self.boardView.bounds.size)
        self.game!.setupSprites()
        self.boardView.presentScene(self.game)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.turnLabel.alpha = 1
        self.turnLabel.text = "Turn \(self.game!.turnsTaken)"
        
        self.scoreLabel.text = "Score: \(self.game!.turnsTaken)"

        self.readyButton.alpha = 0.8
        self.readyButton.isEnabled = true
        
    }
    
    func takeTurn() {
        
//        self.currentTurn = DispatchWorkItem(block: {
//            self.performSegue(withIdentifier: "showQuestion", sender: self)
//        })
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: self.currentTurn!)
        
    }
    
    func move() {
        
        /*
        Make field for player node in BoardViewController
        Make a function for movement that takes in a Move
         if left:
            make SKAction.followPath action using:
                UIBezierPath to define arc path up and left
         if right:
            make SKAction.followPath action using:
                UIBezierPath to define arc path up and right
         if up:
            make SKAction.followPath action using:
                UIBezierPath to define arc path left and up
         if down:
            make SKAction.followPath action using:
                UIBezierPath to define arc path left and down
        */
        
//        var movementPath: UIBezierPath!
//
//        if direction == Move.left {
//
//            // arcCenter in between old and new tile
//            movementPath = UIBezierPath(arcCenter: CGPoint(x: self.playerNode.position.x - 20, y: self.playerNode.position.y), radius: 40, startAngle: 0, endAngle: CGFloat.pi, clockwise: false)
//
//        }
//        else if direction == Move.right {
//
//            // arcCenter in between old and new tile
//            movementPath = UIBezierPath(arcCenter: CGPoint(x: self.playerNode.position.x + 20, y: self.playerNode.position.y), radius: 40, startAngle: CGFloat.pi, endAngle: 0, clockwise: true)
//
//        }
//        else if direction == Move.up {
//
//            // arcCenter in between old and new tile
//            movementPath = UIBezierPath(arcCenter: CGPoint(x: self.playerNode.position.x, y: self.playerNode.position.y), radius: 40, startAngle: 1.5 * CGFloat.pi, endAngle: 0.5 * CGFloat.pi, clockwise: true)
//
//        }
//        else {
//
//            // arcCenter in between old and new tile
//            movementPath = UIBezierPath(arcCenter: CGPoint(x: self.playerNode.position.x, y: self.playerNode.position.y - 20), radius: 40, startAngle: 0.5 * CGFloat.pi, endAngle: 1.5 * CGFloat.pi, clockwise: false)
//
//        }
//
//        let movement = SKAction.follow(movementPath.cgPath, duration: 1.5)
        
        self.game?.movePlayer(numberOfSpaces: 1)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is QuestionViewController {
            
            let questionController = segue.destination as? QuestionViewController
            questionController?.game = self.game
            
        }
    }
    
    func fadeInTurnIntro() {
        
        self.turnLabel.alpha = 0
        
        UIView.animate(withDuration: 1.5, animations: {
            self.turnLabel.alpha = 1
        })
        
    }
    
    func fadeOutTurnIntro() {
        
        self.turnLabel.alpha = 1
        self.readyButton.alpha = 1
        
        UIView.animate(withDuration: 1.5, animations: {
            self.turnLabel.alpha = 0
            self.readyButton.alpha = 0
            self.readyButton.isEnabled = false
        })
        
    }
    
    @IBAction func quitGame(_ sender: Any) {
        
//        self.currentTurn!.cancel()
        
        let alertController = UIAlertController(title: "Quit Game?", message: "Are you sure you want to quit?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Quit", style: .default, handler: { action in
            self.performSegue(withIdentifier: "rewindToHome", sender: self)
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: {
            DispatchQueue.main.resume()
        })
        
    }
    
    @IBAction func backToBoard(segue: UIStoryboardSegue) {
        
        if segue.source is QuestionViewController {
            
            let srcController = segue.source as? QuestionViewController
            self.game = srcController?.game
            
        }
        
    }
    
    @IBAction func startNextTurn(_ sender: Any) {
        
        // fade out intro stuff
        self.fadeOutTurnIntro()
        
        // move (eventually)
        
        // take turn (eventually)
        self.takeTurn()
        
    }
    
    @IBAction func nextMove(_ sender: Any) {
        
        self.move()
        
    }
    
}
