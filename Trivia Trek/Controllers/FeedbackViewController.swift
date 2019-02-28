//
//  FeedbackViewController.swift
//  Trivia Trek
//
//  Created by Samrudh Shenoy on 2/20/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import CloudKit

class FeedbackViewController: UIViewController, UITextViewDelegate {

    /// Cancel button which takes the user to the home screen
    @IBOutlet weak var cancelButton: UIButton!
    
    /// Submits the user's feedback to our online database
    @IBOutlet weak var submitButton: UIButton!
    
    /// The text box in which the user is typing
    @IBOutlet weak var text: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.layer.cornerRadius = 7
        submitButton.layer.cornerRadius = 7
        
        self.text.layer.cornerRadius = 8
        self.text.layer.masksToBounds = true
        self.text.layer.borderColor = UIColor.darkGray.cgColor
        self.text.layer.borderWidth = 2
        self.text.keyboardType = UIKeyboardType.default
        self.text.clearsOnInsertion = true
        self.text.resignFirstResponder()
        self.text.delegate = self

    }
    
    /// Submits the text that the user has typed into our online database and returns the user to the home screen
    @IBAction func submitButton(_ sender: Any) {
            
        let feedback = CKRecord(recordType: "Bug")
        feedback.setObject(self.text!.text as NSString, forKey: "description")
        
        let database = CKContainer.default().privateCloudDatabase
        
        database.save(feedback, completionHandler: { record, error in
            DispatchQueue.main.sync {
<<<<<<< HEAD
//                if error != nil {
//
//                    let alertController = UIAlertController(title: "Thank You", message: "Your feedback has been inputted into our database, we will shortly look into it", preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "Great", style: .default, handler: { action in
//                        self.performSegue(withIdentifier: "rewindToHome", sender: self)
//                    }))
//                    self.present(alertController, animated: true, completion: nil)
//
//                }
//                else {
//
//                    let alert = UIAlertController(title: "Error", message: "There was a problem reporting your bug", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
//                        self.performSegue(withIdentifier: "rewindToHome", sender: self)
//                    }))
//                    self.present(alert, animated: true, completion: nil)
//                }
                
            }
        })
//        self.performSegue(withIdentifier: "rewindToHome", sender: self)
=======
            }
        })
>>>>>>> 61794f080b4d0770bf6f2dd8f366346bcb6bfc6d
        
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


