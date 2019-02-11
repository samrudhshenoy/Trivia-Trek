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


    }
    
    @IBAction func answerChosen(sender: AnyObject) {
        
        guard let choiceButton = sender as? UIButton else {
            
            return
            
        }
        
        // if correct, highlight chosen button green
        // else if incorrect, highlight chosen button red, highlight correct button green
        // unhide done button
        // update game state
        
        choiceButton.backgroundColor = UIColor.red
        
        let correctIndex = self.game!.questions![self.questionIndex].correctAnswer
        
        switch correctIndex {
            
        case 0:
            self.firstChoiceButton.backgroundColor = UIColor.green
        case 1:
            self.secondChoiceButton.backgroundColor = UIColor.green
        case 2:
            self.thirdChoiceButton.backgroundColor = UIColor.green
        case 3:
            self.fourthChoiceButton.backgroundColor = UIColor.green
        default:
            return
            
        }
        
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
