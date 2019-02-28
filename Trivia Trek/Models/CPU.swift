//
//  Player.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 2/2/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

/// Serves as a CPU object, multiple of which will compete against the player in a future version of the game
class CPU {
    
    /// The tile the CPU is currently positioned on
    var pos: Int
    /// The number of questions the CPU  currently has gotten correct
    var qRight: Int
    /// The number of the question the CPU is on
    var numQuestion: Int
    /// The CPU object's image
    var photo: UIImage!
    /// CPU Difficulty (on a scale of 1-3, 1 being easier, 3 being hardest)
    var diff: Int
    
    /**
     Initializes a new CPU with the provided image, difficulty, and number
     
     - Parameters:
     - photo: The CPU's displayed image
     - diff: The CPU's difficulty
     - numCPU: The number of the CPU; used to determine the 'gender' of the CPU's
               profile image
     */
    init(photo: UIImage!, diff: Int, numCPU: Int) {
        if (numCPU % 2 == 0) {
            self.photo = UIImage(named: "cpupicmale")
        }
        else {
            self.photo = UIImage(named: "cpupicfemale")
        }
        
        self.pos = 0
        self.qRight = 0
        self.numQuestion = 1
        self.diff = diff
    }
    
    /**
     - Returns: The current position of the CPU on the game board
     */
    func getPos () -> Int {
        return pos
    }
    
    /**
     - Returns: The number of questions the CPU has gotten right
     */
    func getQuestionsRight () -> Int {
        return qRight
    }
    
    /**
     - Returns: The number of the question the CPU is on
     */
    func getNumQuestion () -> Int {
        return numQuestion
    }
    
    /**
     - Returns: The number of questions the CPU has gotten incorrect
     */
    func getQuestionsWrong () -> Int {
        return numQuestion - qRight
    }
    
    /**
        Advances the CPU to the next spot on the game board
     */
    func nextPos () {
        pos += 1
    }
    
    /**
     Has the CPU get its question correct or incorrect, based on the player's
     current progress and the CPU's difficulty
     
     - Parameters:
     - playerCorrect: The current number of questions the player has gotten correct
     
     - Returns: Boolean - whether the CPU has gotten the question correct or incorrect
     */
    func act(playerCorrect: Int) -> Bool{
        if (diff == 1) { // easy
            if (qRight - playerCorrect <= -3) {
                qRight += 1
                numQuestion += 1
                return true
            }
            numQuestion += 1
            return false
            
        }
        else if (diff == 2) { //medium
            if (qRight - playerCorrect <= -1) {
                qRight += 1
                numQuestion += 1
                return true
            }
            numQuestion += 1
            return false
        }
        else { //hard
            if (qRight - playerCorrect > 0) {
                numQuestion += 1
                return false
            }
            qRight += 1
            numQuestion += 1
            return true
            
        }
    }
    
    /**
     Returns the CPU's difficulty
     
     - Returns: The CPU's difficulty (1-3 scale)
     */
    func getDiff() -> Int {
        return diff
    }
    
    
}
