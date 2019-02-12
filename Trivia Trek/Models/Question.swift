//
//  Question.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/11/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class Question: NSObject {

    var text: String
    var answers: [String]
    var correctAnswer: Int
    
    init(text: String, answers: [String], correctAnswer: Int) {
        
        self.text = text
        self.answers = answers
        self.correctAnswer = correctAnswer
        
    }
    
}
