//
//  Game.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/10/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import GameKit
import CloudKit

// The game object of which the centrality of the entire game is based on
class Game: NSObject {
    
    // Maximum number of turns taken by a player
    var maxTurns: Int
    
    // Current number of turns taken by a player
    var turnsTaken: Int
    
    // Player object which is stored in the game
    var player: Player
    
    // Game background image
    var map: UIImage
    
    // Array of questions with answers, sourced from the online database
    var questions: [Question] = []
    
    /**
     Initializes a new game with given maximum turns, player object, and background image
     
     - Parameters:
     - maxTurns: The maximum number of turns the player has opted for
     - player: The player object to be stored in the program
     - map: The background image of the map
     
     */
    init(maxTurns: Int, player: Player, map: UIImage) {
        
        self.maxTurns = maxTurns
        self.player = player
        self.turnsTaken = 1
        self.map = map
        
        super.init()

        self.loadQuestions()
    }
    
    /**
     Loads all the questions from the online database into the Questions array.
     Throws command line errors in the case that the database is unreachable or
     if no network connection is detected.
     */
    func loadQuestions() {
        
//        let question = Question(text: "what's 1 + 2?", answers: ["1", "2", "3", "4"], correctAnswer: 2)
//        let secondQuestion = Question(text: "what's 2 * 2?", answers: ["2", "4", "6", "8"], correctAnswer: 1)
//
//        self.questions = [question, secondQuestion]
        
        let database = CKContainer.default().publicCloudDatabase
        
        let query = CKQuery(recordType: "Question", predicate: NSPredicate(value: true))
        
        database.perform(query, inZoneWith: nil, completionHandler: { questions, error in
            if error != nil {
                
                print("Query failed with error \(error?.localizedDescription ?? "none")")
                
            }
            else {
                
                for questionRecord in questions! {
                    
                    self.questions.append(Question(record: questionRecord))
                    
                }
                
            }
            
        })
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
