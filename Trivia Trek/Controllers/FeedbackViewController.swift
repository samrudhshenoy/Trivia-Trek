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

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
            
        let feedback = CKRecord(recordType: "Bug")
        feedback.setObject(self.text!.text as NSString, forKey: "description")
        
        let database = CKContainer.default().privateCloudDatabase
        
        database.save(feedback, completionHandler: { record, error in
            DispatchQueue.main.sync {
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


