//
//  ConnectViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/24/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import FBSDKLoginKit
//import SCSDKLoginKit

class ConnectViewController: UIViewController {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    @IBOutlet weak var backButton: UIButton!
//    @IBOutlet weak var scLoginButton: SCSDKLoginButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        
//        let scLoginButton = SCSDKLoginButton()
        
        self.loginButton.center = view.center
//            self.scLoginButton.center = view.center
        
        
        // Obtain all constraints for the button:
        let layoutConstraintsArr = loginButton.constraints
//        let layoutConstraintsArrSC = scLoginButton.constraints
        // Iterate over array and test constraints until we find the correct one:
        for lc in layoutConstraintsArr { // or attribute is NSLayoutAttributeHeight etc.
            if ( lc.constant == 28 ){
                // Then disable it...
                lc.isActive = false
                break
            }
        }
        
//        for lc in layoutConstraintsArrSC {
//            if lc.constant == 28 {
//                lc.isActive = false
//                break
//            }
//        }
        
        
        
        if backButton != nil {
            self.backButton.layer.cornerRadius = 7
        }
        
        
        view.addSubview(loginButton)
//        view.addSubview(scLoginButton)
        
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("User Logged In")
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("public_profile")
            {
                // Do work
            }
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
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
