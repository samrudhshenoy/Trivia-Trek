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
    
    @IBOutlet weak var board: SKView!
    @IBOutlet weak var turn: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var quit: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var ready: UIButton!

    @IBOutlet weak var done: UIButton!
    
    var game: Game?
    var isPaused: Bool = false
    var currentTurn: DispatchWorkItem?
    var currentTime: Double = 0
    var currentRound: Int = 1
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.quit.layer.cornerRadius = 7
        self.ready.layer.cornerRadius = 7

        self.done.layer.cornerRadius = 11
        self.done.alpha = 0
        self.done.isEnabled = false
        
        self.currentTime = 0
        
        self.game!.initBackground(size: self.board.bounds.size)
        self.game!.setupSprites()
        self.board.presentScene(self.game)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if self.game!.turnsTaken == 40 {
            let final = FinalPageViewController()
            present(final, animated: true, completion: nil)
        }
        
        self.turn.alpha = 1
        self.turn.text = "Turn \(self.game!.turnsTaken)"
        
        var finished: Bool = false

        if self.game!.player.pos == 38 {
            finished = true
            self.done.alpha = 0.8
            self.done.isEnabled = true
            self.ready.alpha = 0
            self.ready.isEnabled = false
        }
        
        if !finished {
            self.ready.alpha = 0.8
            self.ready.isEnabled = true
            self.turn.alpha = 1
            self.turn.text = "Turn \(self.game!.turnsTaken)"
        }
        
        self.score.text = "Score: \(self.game!.turnsTaken)"
        
        if self.game!.player.pos == 39 {
            // SHOW THE FINAL VIEW CONTROLLER
        }
                
        if self.game!.turnsTaken != 1 {
            var ns: Int
            if self.game!.qCorrect {
                
                ns = self.game!.streak
                
                if ns > (38-self.game!.player.pos) {
                    ns = 38-self.game!.player.pos
                }
            }
            else {
                ns = 0
            }
            self.makeMove(numSpaces: ns)
        }
            
        if self.game!.turnsTaken % 13 == 0 && self.game!.turnsTaken <= 27 {
            currentRound += 1
            self.round.text = "Round \(self.currentRound)"
            self.round.alpha = 1
            
            self.fadeOutRoundIntro()
        }
        else if self.game!.turnsTaken == 1 {
            self.round.text = "Round \(self.currentRound)"
            self.round.alpha = 1
            
            self.fadeOutRoundIntro()
        }
        
        
        
    }
    
    func takeTurn() {
        
        self.currentTurn = DispatchWorkItem(block: {
            self.performSegue(withIdentifier: "showQuestion", sender: self)
        })

        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: self.currentTurn!)
        
    }
    
    func makeMove(numSpaces: Int) {
        
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
        
        self.game?.movePlayer(numberOfSpaces: numSpaces)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is QuestionViewController {
            
            let questionController = segue.destination as? QuestionViewController
            questionController?.game = self.game
            
        }
    }
    
    func fadeInTurnIntro() {
        
        self.turn.alpha = 0
        
        UIView.animate(withDuration: 1.5, animations: {
            self.turn.alpha = 1
        })
        
    }
    
    func fadeOutTurnIntro() {
        
        self.turn.alpha = 1
        self.ready.alpha = 1
        
        UIView.animate(withDuration: 1.5, animations: {
            self.turn.alpha = 0
            self.ready.alpha = 0
            self.ready.isEnabled = false
        })
        
    }
    
    func fadeOutRoundIntro() {
        
        self.round.alpha = 1
        
        UIView.animate(withDuration: 1.5, animations: {
            self.round.alpha = 0
        })
        
    }
    
    @IBAction func quitOut (_ sender: Any) {
        
        
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
    
    @IBAction func startTurn (_ sender: Any) {
    
    self.fadeOutTurnIntro()
        
        // move (eventually)
        
        // take turn (eventually)
        self.takeTurn()
        
    }
    
}
