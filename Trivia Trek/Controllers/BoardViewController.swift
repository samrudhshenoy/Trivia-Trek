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
    @IBOutlet weak var quit: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var ready: UIButton!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var game: Board?
    var isPaused: Bool = false
    var currentTurn: DispatchWorkItem?
    var currentTime: Double = 0
    var currentRound: Int = 1
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.quit.layer.cornerRadius = 15
        self.ready.layer.cornerRadius = 15
        
        self.currentTime = 0
        self.game!.initBackground(size: self.board.bounds.size)
        self.game!.addPlayerSprite()
        self.board.presentScene(self.game)
        self.turn.adjustsFontSizeToFitWidth = true
        self.highScoreLabel.adjustsFontSizeToFitWidth = true
        
        let score = UserDefaults.standard.integer(forKey: "bestScore")
        self.highScoreLabel.text = "Best Score: \(score == -1 ? "N/A" : "\(score)")"
        self.score.adjustsFontSizeToFitWidth = true
        
        self.view.bringSubviewToFront(self.ready)
        self.view.bringSubviewToFront(self.turn)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
    }
    
    func nextMove() {
        
        var mvmtChain: SKAction
        var movements: [SKAction] = []
        var numberOfSpaces = Int(self.game!.streak / 2.0 + 0.5)
        
        if self.game!.player.pos + numberOfSpaces > self.game!.map.path.count - 1 {
            numberOfSpaces = self.game!.map.path.count - self.game!.player.pos - 1
        }
        
        for _ in 0..<numberOfSpaces {
            
            let nextTile = self.game!.map.path[self.game!.player.pos + 1]
            let movement = SKAction.move(to: nextTile.sprite.position, duration: 1.0)
            movements.append(movement)
            self.game!.player.pos += 1
            
        }
        
        if movements.count > 0 {
            
            mvmtChain = SKAction.sequence(movements)
            
            if self.game!.player.pos >= self.game!.map.path.count - 1 {
                
                self.game!.player.sprite.run(mvmtChain, completion: self.finishGame)
                
            }
            else {
                
                self.game!.player.sprite.run(mvmtChain, completion: self.fadeInTurnIntro)
                
            }
            
        }
        else {
            
            self.fadeInTurnIntro()
            
        }
        
        
    }
    
    func askQuestion() {
        
        self.currentTurn = DispatchWorkItem(block: {
            self.performSegue(withIdentifier: "showQuestion", sender: self)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: self.currentTurn!)
        
    }
    
    func finishGame() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            self.performSegue(withIdentifier: "showFinalScreen", sender: self)
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is QuestionViewController {
            
            let questionController = segue.destination as? QuestionViewController
            questionController?.game = self.game
            
        }
        else if segue.destination is FinalPageViewController {
            
            let finalScreen = segue.destination as? FinalPageViewController
            finalScreen?.finalScore = self.game!.turnsTaken
            
        }
        
    }
    
    func fadeInTurnIntro() {
                
        self.turn.text = "Turn \(self.game!.turnsTaken + 1)"
        
        self.score.text = "Streak: \(Int(self.game!.streak))"
        
        UIView.animate(withDuration: 1.5, animations: {
            self.turn.alpha = 1
            self.bannerView.alpha = 0.7
            self.ready.alpha = 1
            self.ready.isEnabled = true
            
        })
    }
    
    func fadeOutTurnIntro() {
        
        self.turn.alpha = 1
        self.ready.alpha = 1
        
        UIView.animate(withDuration: 1.5, animations: {
            self.turn.alpha = 0
            self.ready.alpha = 0
            self.ready.isEnabled = false
            self.bannerView.alpha = 0
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
        
        // increment turnsTaken
        self.game!.turnsTaken += 1
        
        // - fade out ui stuff
        self.fadeOutTurnIntro()
        
        // - move player
        self.askQuestion()
        
    }
    
}
