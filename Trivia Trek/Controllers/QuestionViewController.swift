//
//  QuestionViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/11/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//
import UIKit

class QuestionViewController: UIViewController {
    
    /// Label with the question listed on it
    @IBOutlet weak var questionLabel: UILabel!
    
    /// Bar which represents the user's progress in time
    @IBOutlet weak var timeProgressBar: UIProgressView!
    
    /// All 4 answer choice buttons

    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var fourthChoiceButton: UIButton!
    
    
    /// Button which pops up after a question is answered, and allows the user to return back to the game board
    @IBOutlet weak var doneButton: UIButton!
    
    /// Game board
    var game: Board?
    /// Index of correct question in question array
    var questionIndex: Int = -1
    /// Whether the user has gotten the question correct or incorrect
    var correct: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionLabel.adjustsFontSizeToFitWidth = true
        self.firstChoiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        self.secondChoiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        self.thirdChoiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        self.fourthChoiceButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        // get random question from game
        self.questionIndex = Int.random(in: 0..<self.game!.questions.count)
        let question = self.game!.questions[self.questionIndex]
        
        self.questionLabel.text = question.text
        
        self.firstChoiceButton.setTitle(question.answers[0], for: .normal)
        self.firstChoiceButton.layer.cornerRadius = 15
        
        self.secondChoiceButton.setTitle(question.answers[1], for: .normal)
        self.secondChoiceButton.layer.cornerRadius = 15
        
        self.thirdChoiceButton.setTitle(question.answers[2], for: .normal)
        self.thirdChoiceButton.layer.cornerRadius = 15
        
        self.fourthChoiceButton.setTitle(question.answers[3], for: .normal)
        self.fourthChoiceButton.layer.cornerRadius = 15
        
        self.doneButton.layer.cornerRadius = 15
        self.doneButton.alpha = 0
        
    }
    
    /// Triggers furthur actions once the user has answered the question
    @IBAction func answerChosen(sender: AnyObject) {
        
        guard let choiceButton = sender as? UIButton else {
            
            return
            
        }
        
        // if correct, highlight chosen button green
        // else if incorrect, highlight chosen button red, highlight correct button green
        // unhide done button
        // update game state
        
        let correctIndex = self.game!.questions[self.questionIndex].correctAnswer + 1
        
        if choiceButton.tag != correctIndex {
            self.game!.streak = 0
            UIView.animate(withDuration: 0.7, animations: {
                choiceButton.backgroundColor = UIColor.red
                
            })
        }
        else {
            self.game!.streak += 1
        }
        
        switch correctIndex {
            
        case 1:
            self.firstChoiceButton.isEnabled = false
            self.secondChoiceButton.isEnabled = false
            self.thirdChoiceButton.isEnabled = false
            self.fourthChoiceButton.isEnabled = false
            
            UIView.animate(withDuration: 0.7, animations: {
                self.firstChoiceButton.backgroundColor = UIColor.green
            })
        case 2:
            self.firstChoiceButton.isEnabled = false
            self.secondChoiceButton.isEnabled = false
            self.thirdChoiceButton.isEnabled = false
            self.fourthChoiceButton.isEnabled = false
            
            UIView.animate(withDuration: 0.7, animations: {
                self.secondChoiceButton.backgroundColor = UIColor.green
            })
        case 3:
            self.firstChoiceButton.isEnabled = false
            self.secondChoiceButton.isEnabled = false
            self.thirdChoiceButton.isEnabled = false
            self.fourthChoiceButton.isEnabled = false
            
            UIView.animate(withDuration: 0.7, animations: {
                self.thirdChoiceButton.backgroundColor = UIColor.green
            })
        case 4:
            self.firstChoiceButton.isEnabled = false
            self.secondChoiceButton.isEnabled = false
            self.thirdChoiceButton.isEnabled = false
            self.fourthChoiceButton.isEnabled = false
            
            UIView.animate(withDuration: 0.7, animations: {
                self.fourthChoiceButton.backgroundColor = UIColor.green
            })
        default:
            return
            
        }
        
        UIView.animate(withDuration: 0.7, animations: {
            self.doneButton.alpha = 1
        })
    }
    
    /// Returns the user to the board screen once the 'done' button is tapped
    @IBAction func doneButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "backToBoard", sender: self)
        
    }
    
    
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is BoardViewController {
            
            let boardVC = segue.destination as? BoardViewController
            boardVC!.game!.questions.remove(at: self.questionIndex)
            boardVC!.nextMove()
            
        }
     }
    
    
}
