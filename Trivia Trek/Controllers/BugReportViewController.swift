//
//  BugReportViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 2/12/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import MessageUI

class BugReportViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var textField: UITextView!
    
    //Submit button pressed
    @available(iOS, deprecated: 9.0)
    @IBAction func submitButton(_ sender: Any) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    //Configures a view controller in which to send the email
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self as MFMailComposeViewControllerDelegate // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["triviatrek@hhsfbla.com"])
        mailComposerVC.setSubject("Trivia Trek Bug Report")
        mailComposerVC.setMessageBody(textField.text, isHTML: false)
        
        return mailComposerVC
    }
    
    //Returns error message if email sending is unsuccessful
    @available(iOS, deprecated: 9.0)
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var cancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.layer.cornerRadius = 8
        self.textField.layer.masksToBounds = true
        self.textField.layer.borderColor = UIColor.darkGray.cgColor
        self.textField.layer.borderWidth = 2
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
