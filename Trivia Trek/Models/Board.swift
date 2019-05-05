//
//  Game.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import SpriteKit
import CloudKit
import FirebaseFirestore

// The game object of which the centrality of the entire game is based on
class Board: SKScene {
    
    // Maximum number of turns taken by a player
    var maxTurns: Int
    
    // Current number of turns taken by a player
    var turnsTaken: Int
    
    // Player object which is stored in the game
    var player: Player
    
    // Array of questions with answers, sourced from the online database
    var questions: [Question] = []
    
    /// Dictionary linking questions to the provided answers, as the game progresses
    var game: [String: Int] = [:]
    
    /// The board's map course
    var map: Map
    
    /// The background image for the map
    var background: SKSpriteNode?
    
    /// The player's current answer streak
    var streak: Double
    
    /// Initializes a new game with given maximum turns, player object, and background image
    init(maxTurns: Int, player: Player, mapType: Map.MapType) {
        self.maxTurns = maxTurns
        self.player = player
        self.turnsTaken = 0
        self.map = Map.defaultMap(type: .normal)
        self.streak = 0
        
        super.init()
        
        self.scaleMode = .fill
        
        self.backgroundColor = UIColor.green

        self.loadQuestions()
    }
    
    /// Initializes a new game with given size and default game parameters
    override init(size: CGSize) {
        
        self.maxTurns = 0
        self.player = Player()
        self.turnsTaken = 0
        self.map = Map.defaultMap(type: .normal)
        self.streak = 0

        super.init(size: size)
        
        self.backgroundColor = UIColor.green
        
        self.loadQuestions()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Loads the questions from the database
    func loadQuestions() {
        
        let db = Firestore.firestore()
        let questions = db.collection("questions")
        
        questions.getDocuments(completion: { result, error in
            if error != nil {
                print("\(error?.localizedDescription ?? "none")")
            }
            else {
                for question in result!.documents {
                    self.questions.append(Question(fromObj: question))
                }
            }
        })
        
    }
    
    /// Add the player sprite to the scene
    func setupSprites() {
        
        if self.player.sprite.parent == nil {
            self.player.sprite.position = self.map.path[self.player.pos].sprite.position
            self.addChild(self.player.sprite)
        }
    
    }
    
    /// Add the map image to the scene
    func initBackground(size: CGSize) {
        
        self.size = size
        
        self.background!.size = self.size
        self.background!.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        if self.background!.parent == nil {
            self.addChild(self.background!)
        }
        
    }
    
    /// Switch the map type and update the player's positio accordingly
    func toggleMapType() {
//        self.map.toggleType()
        self.player.sprite.position = self.map.path[0].sprite.position
    }
    
}
