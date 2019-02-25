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
    @IBOutlet weak var streakLabel: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    
    var game: Game?
    var questionIndex: Int = -1
    var correct: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.streakLabel.alpha = 0
        
        // get random question from game
        self.questionIndex = Int.random(in: 0..<self.game!.questions.count)
        let question = self.game!.questions[self.questionIndex]
        
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
        
        let correctIndex = self.game!.questions[self.questionIndex].correctAnswer + 1
        
        self.game!.questions.remove(at: self.questionIndex)
        
        if choiceButton.tag != correctIndex {
            self.game!.streak = 0
            UIView.animate(withDuration: 0.7, animations: {
                choiceButton.backgroundColor = UIColor.red
          
            })
            self.streakLabel.text = "Streak - \(self.game!.streak)"
            fadeOutStreakLabel()

        }
        else {
            
            self.game!.streak += 1
            self.correct = true
            self.streakLabel.text = "Streak - \(self.game!.streak)"
            fadeOutStreakLabel()
            
            
//            let timeTaken = (DispatchTime.now().uptimeNanoseconds - start.uptimeNanoseconds) / UInt64(1_000_000_000.0)
//
//            if timeTaken <= 2 {
//                self.pointsLabel.text = "+100"
//                fadeOutPointsLabel()
//                self.game!.points += 100
//
//            }
//            else if timeTaken <= 3 {
//                self.pointsLabel.text = "+75"
//                fadeOutPointsLabel()
//                self.game!.points += 75
//            }
//            else if timeTaken <= 4 {
//                self.pointsLabel.text = "+50"
//                fadeOutPointsLabel()
//                self.game!.points += 50
//            }
//            else {
//                self.pointsLabel.text = "+25"
//                fadeOutPointsLabel()
//                self.game!.points += 25
//            }
            
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
            self.doneButton.isHidden = false
        })
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        if correct {
            self.game!.qCorrect = true
        }
        else {
            self.game!.qCorrect = false
        }
        
        
        self.performSegue(withIdentifier: "backToBoard", sender: self)
        
    }
    
    func fadeOutStreakLabel() {
        
        self.streakLabel.alpha = 0
        self.streakLabel.textColor = UIColor.white
        
        UIView.animate(withDuration: 1.5, animations: {
            self.streakLabel.alpha = 1
        })
        
        UIView.animate(withDuration: 1.5, animations: {
            self.streakLabel.alpha = 0
        })
        
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
