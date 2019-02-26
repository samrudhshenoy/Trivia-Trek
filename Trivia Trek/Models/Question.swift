//
//  Question.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/11/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import CloudKit

/**
 Serves as a singular question in the game, with an array of answers,
 three of which are wrong, and one of which is correct
*/
class Question: NSObject {

    /// Question (stored as a String)
    var text: String
    
    /// Array of answers which belong to a question
    var answers: [String]
    
    /// Array index of correct answer
    var correctAnswer: Int
    
    /**
     Initializes a new Question with text, answers, and correct answer given
     
     - Parameters:
     - text: The stored text of the question
     - answers: The array of answers which belong to a question
     - correctAnswer: Index of 'answers' which contains the correct answer
     */
    init(text: String, answers: [String], correctAnswer: Int) {
        
        self.text = text
        self.answers = answers
        self.correctAnswer = correctAnswer
        
    }
    
    /**
     Initializes a new Question with information given in a CloudKit Record
     
     - Parameters:
     - CKRecord: The CloudKit Record in which the data is stored
     */
    init(record: CKRecord) {
        
        self.text = record.object(forKey: "text") as! String
        self.answers = record.object(forKey: "answers") as! [String]
        self.correctAnswer = record.object(forKey: "correctAnswer") as! Int
        
    }
    
}
