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
        
        let board = SKScene(size: self.boardView.bounds.size)
        board.backgroundColor = UIColor(red: 18/255, green: 126/255, blue: 13/255, alpha: 1)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: board.size.width / 2, y: board.size.height / 2)
        background.size = CGSize(width: board.size.width, height: board.size.height - 10)
        board.addChild(background)
        
        let player = SKSpriteNode(imageNamed: "avatar-sample")
        player.position = CGPoint(x: Map.initialPosition.x, y: Map.initialPosition.y)
        player.size = CGSize(width: 30, height: 30)
        board.addChild(player)
        
        currentTime = 0
        
        self.boardView.presentScene(board)
        
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
        
    }
    
}
