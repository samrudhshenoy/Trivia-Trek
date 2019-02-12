//
//  QuestionViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/11/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var timeProgressBar: UIProgressView!
    
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    @IBOutlet weak var fourthChoiceButton: UIButton!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var game: Game?
    var questionIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // get random question from game
        self.questionIndex = Int.random(in: 0..<self.game!.questions!.count)
        let question = self.game!.questions![self.questionIndex]
        
        self.questionLabel.text = question.text
        
        self.firstChoiceButton.setTitle(question.answers[0], for: .normal)
        self.firstChoiceButton.layer.cornerRadius = 7
        
        self.secondChoiceButton.setTitle(question.answers[1], for: .normal)
        self.secondChoiceButton.layer.cornerRadius = 7

        self.thirdChoiceButton.setTitle(question.answers[2], for: .normal)
        self.thirdChoiceButton.layer.cornerRadius = 7

        self.fourthChoiceButton.setTitle(question.answers[3], for: .normal)
        self.fourthChoiceButton.layer.cornerRadius = 7

        self.doneButton.layer.cornerRadius = 7
        self.doneButton.isHidden = true

        self.game?.turnsTaken += 1
        
    }
    
    @IBAction func answerChosen(sender: AnyObject) {
        
        guard let choiceButton = sender as? UIButton else {
            
            return
            
        }
        
        // if correct, highlight chosen button green
        // else if incorrect, highlight chosen button red, highlight correct button green
        // unhide done button
        // update game state
        
        let correctIndex = self.game!.questions![self.questionIndex].correctAnswer + 1
        
        if choiceButton.tag != correctIndex {
            
            UIView.animate(withDuration: 0.7, animations: {
                choiceButton.backgroundColor = UIColor.red
            })

        }
        else {
            
            self.game!.player.numberCorrect += 1
            
        }
        
        switch correctIndex {
            
            case 1:
                UIView.animate(withDuration: 0.7, animations: {
                    self.firstChoiceButton.backgroundColor = UIColor.green
                    
                    self.firstChoiceButton.isEnabled = false
                    self.secondChoiceButton.isEnabled = false
                    self.thirdChoiceButton.isEnabled = false
                    self.fourthChoiceButton.isEnabled = false
                })
            case 2:
                UIView.animate(withDuration: 0.7, animations: {
                    self.secondChoiceButton.backgroundColor = UIColor.green
                    
                    self.firstChoiceButton.isEnabled = false
                    self.secondChoiceButton.isEnabled = false
                    self.thirdChoiceButton.isEnabled = false
                    self.fourthChoiceButton.isEnabled = false
                })
            case 3:
                UIView.animate(withDuration: 0.7, animations: {
                    self.thirdChoiceButton.backgroundColor = UIColor.green
                    
                    self.firstChoiceButton.isEnabled = false
                    self.secondChoiceButton.isEnabled = false
                    self.thirdChoiceButton.isEnabled = false
                    self.fourthChoiceButton.isEnabled = false
                })
            case 4:
                UIView.animate(withDuration: 0.7, animations: {
                    self.fourthChoiceButton.backgroundColor = UIColor.green
                    
                    self.firstChoiceButton.isEnabled = false
                    self.secondChoiceButton.isEnabled = false
                    self.thirdChoiceButton.isEnabled = false
                    self.fourthChoiceButton.isEnabled = false
                })
            default:
                return
            
        }
        
        UIView.animate(withDuration: 0.7, animations: {
            self.doneButton.isHidden = false
        })
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backToBoard", sender: self)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
