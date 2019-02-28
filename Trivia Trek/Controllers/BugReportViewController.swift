//
//  BugReportViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 2/12/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import CloudKit

class BugReportViewController: UIViewController, UITextViewDelegate {
    
    /// Field where the user enters their description
    @IBOutlet weak var textField: UITextView!
    
    /// Submits the text to our online databases
    @IBOutlet weak var submitButton: UIButton!
    
    /// Cancels and returns to the home screen
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.layer.cornerRadius = 10
        self.textField.layer.masksToBounds = true
        self.textField.layer.borderColor = UIColor.darkGray.cgColor
        self.textField.layer.borderWidth = 2
        self.textField.keyboardType = UIKeyboardType.default
        self.textField.clearsOnInsertion = true
        self.textField.resignFirstResponder()
        self.textField.delegate = self
        
        self.submitButton.layer.cornerRadius = 15
        self.cancelButton.layer.cornerRadius = 15
        
    }
    
    /// Submits user-entered text into our database
    @IBAction func submitButton(_ sender: Any) {
        
        // do the query
        let bugReport = CKRecord(recordType: "Bug")
        bugReport.setObject(self.textField!.text as NSString, forKey: "description")
        
        let database = CKContainer.default().publicCloudDatabase
        
        database.save(bugReport, completionHandler: { record, error in
            DispatchQueue.main.sync {
                self.performSegue(withIdentifier: "rewindToHome", sender: self)
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// Returns to the title screen
    @IBAction func rewindToHome(_ sender: Any) {
        
        self.performSegue(withIdentifier: "rewindToHome", sender: self)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            self.textField.endEditing(true)
            return false
        }
        else {
            return true
        }
    }
    
}
