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

// The game object of which the centrality of the entire game is based on
class Game: SKScene {
    
    // Maximum number of turns taken by a player
    var maxTurns: Int
    
    // Current number of turns taken by a player
    var turnsTaken: Int
    
    // Player object which is stored in the game
    var player: Player
    
    // Array of questions with answers, sourced from the online database
    var questions: [Question] = []
    
    var map: Map
    
    var background: SKSpriteNode?
    
    /**
     Initializes a new game with given maximum turns, player object, and background image
     
     - Parameters:
     - maxTurns: The maximum number of turns the player has opted for
     - player: The player object to be stored in the program
     - map: The background image of the map
     
     */
    init(maxTurns: Int, player: Player, mapType: Map.MapType) {
        self.maxTurns = maxTurns
        self.player = player
        self.turnsTaken = 1
        self.map = Map.defaultMap(type: .normal)

        self.background = SKSpriteNode(imageNamed: "background")
        
        super.init()
        
        self.backgroundColor = Map.mapBackgrounds[mapType.rawValue]

        self.loadQuestions()
    }
    
    override init(size: CGSize) {
        
        self.maxTurns = 0
        self.player = Player()
        self.turnsTaken = 1
        self.map = Map.defaultMap(type: .normal)
        
        self.background = SKSpriteNode(imageNamed: "background")
        
        super.init(size: size)
        
        self.backgroundColor = Map.mapBackgrounds[Map.MapType.normal.rawValue]
        
        self.loadQuestions()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Loads all the questions from the online database into the Questions array.
     Prints error description in the console if query fails
     */
    func loadQuestions() {
        
//        let question = Question(text: "what's 1 + 2?", answers: ["1", "2", "3", "4"], correctAnswer: 2)
//        let secondQuestion = Question(text: "what's 2 * 2?", answers: ["2", "4", "6", "8"], correctAnswer: 1)
//
//        self.questions = [question, secondQuestion]
        
//        let database = CKContainer.default().publicCloudDatabase
//
//        let query = CKQuery(recordType: "Question", predicate: NSPredicate(value: true))
//
//        database.perform(query, inZoneWith: nil, completionHandler: { questions, error in
//            if error != nil {
//
//                print("Query failed with error \(error?.localizedDescription ?? "none")")
//
//            }
//            else {
//
//                for questionRecord in questions! {
//
//                    self.questions.append(Question(record: questionRecord))
//
//                }
//
//            }
//
//        })
    }
    
    func movePlayer(numberOfSpaces: Int) {
        
        let newTile = self.map.path[self.player.pos + numberOfSpaces]
        let movement = SKAction.move(to: newTile.sprite.position, duration: 1.5)
        self.player.sprite.run(movement)
        self.player.pos += numberOfSpaces
        
    }
    
    func setupSprites() {
        
        if self.player.sprite.parent == nil {
            self.player.sprite.position = self.map.path[self.player.pos].sprite.position
            self.addChild(self.player.sprite)
        }
        
//        for tile in self.map.path {
//
//            if tile.sprite.parent == nil {
//                self.addChild(tile.sprite)
//            }
//
//        }
//
//        for decoration in self.map.decorations {
//
//            if decoration.parent == nil {
//                self.addChild(decoration)
//            }
//
//        }
//
//        print(self.map.path.count)
        
    }
    
    func initBackground(size: CGSize) {
        
        self.size = size
        
        self.background!.size = self.size
        self.background!.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        if self.background!.parent == nil {
            self.addChild(self.background!)
        }
        
    }
    
    /**
        Initializes the setup of the game, and executes basic game functions
     */
    func start() {
        
        while self.turnsTaken <= self.maxTurns {
            
            /*
             - roll dice
                - show moving number node thing, fast forward through number set behind the scenes
                - when user hits roll button, choose current number -> that's user's roll
                - multiply by answer streak multiplier thing
             - move one tile at a time
            */
            
        }
        
    }
    
    /**
     Serves as a player's or CPU's turn taken
     */
    func takeTurn() {
        
        /*
         Game flow (main loop pseudocode):
         - roll dice (or other do movement decision thing)
         - move
            - do any actions necessary while moving (depending on spaces hit, etc)
            - do final action for space landed on if any
         - pull up minigame screen
            - choose random minigame to do (maybe animate choice screen)
            - do minigame
            - update game state based on results
         - continue to next turn
         */
        
    }
    
}
