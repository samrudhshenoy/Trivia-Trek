//
//  LoginViewController.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 3/4/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var loginPicker: UISegmentedControl!
    @IBOutlet weak var loginButton: UIButton!
    
    var loginForm: LoginFormViewController!
    var signupForm: SignupFormViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loginButton.layer.cornerRadius = 15

        switch self.loginPicker.selectedSegmentIndex {

            case 0:
                self.loginForm.view.isHidden = false
                self.signupForm.view.isHidden = true

            case 1:
                self.loginForm.view.isHidden = true
                self.signupForm.view.isHidden = false

            default:
                break

        }
        
    }
    
    func login() {
        
        let email = self.loginForm.emailField.text!
        let password = self.loginForm.passwordField.text!
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
            self.dismiss(animated: true, completion: {})
        })
        
    }
    
    func signUp() {
        
        let username = self.signupForm.usernameField.text!
        let email = self.signupForm.emailField.text!
        let password = self.signupForm.passwordField.text!
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in
            if error != nil {
                
                print("\(error?.localizedDescription ?? "none")")
            }
            
            let user = result!.user
            
            let request = user.createProfileChangeRequest()
            
            request.displayName = username
            request.commitChanges(completion: { error in
                let alertScreen = UIAlertController(title: "Signed up", message: "Successfully created your Trivia Trek Account", preferredStyle: .alert)
                
                let done = UIAlertAction(title: "Done", style: UIAlertAction.Style.default, handler: { action in
                    self.dismiss(animated: true, completion: {})
                })
                
                alertScreen.addAction(done)
            })
        })
        
    }
    
    @IBAction func switchLoginTab(_ sender: Any) {
        
        switch self.loginPicker.selectedSegmentIndex {
            
        case 0:
            self.loginForm.view.isHidden = false
            self.signupForm.view.isHidden = true
            
        case 1:
            self.loginForm.view.isHidden = true
            self.signupForm.view.isHidden = false
            
        default:
            break
            
        }
        
    }
    
    @IBAction func doLogin(_ sender: Any) {
        
        switch loginPicker.selectedSegmentIndex {

            case 0:
                self.login()

            case 1:
                self.signUp()

            default:
                break
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is LoginFormViewController {
            
            let formVC = segue.destination as? LoginFormViewController
            self.loginForm = formVC
            
        }
        else if segue.destination is SignupFormViewController {
            
            let formVC = segue.destination as? SignupFormViewController
            self.signupForm = formVC
            
        }
        
    }

}
