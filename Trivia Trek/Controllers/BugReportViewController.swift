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
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.layer.cornerRadius = 8
        self.textField.layer.masksToBounds = true
        self.textField.layer.borderColor = UIColor.darkGray.cgColor
        self.textField.layer.borderWidth = 2
        self.textField.keyboardType = UIKeyboardType.default
        self.textField.clearsOnInsertion = true
        self.textField.resignFirstResponder()
        self.textField.delegate = self
        
        self.submitButton.layer.cornerRadius = 7
        self.cancelButton.layer.cornerRadius = 7
        
    }
    
    @IBAction func submitButton(_ sender: Any) {
        
        // do the query
        let bugReport = CKRecord(recordType: "Bug")
        bugReport.setObject(self.textField!.text as NSString, forKey: "description")
        
        let database = CKContainer.default().privateCloudDatabase
        
        database.save(bugReport, completionHandler: { record, error in
            DispatchQueue.main.sync {
                if error != nil {
                    
                    let alert = UIAlertController(title: "Error", message: "There was a problem reporting your bug", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        self.performSegue(withIdentifier: "rewindToHome", sender: self)
                    }))
                    self.present(alert, animated: true, completion: nil)
                    
                }
                else {
                    self.performSegue(withIdentifier: "rewindToHome", sender: self)

                }
        
            }
        })
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
