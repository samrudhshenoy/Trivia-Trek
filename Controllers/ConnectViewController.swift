//
//  ConnectViewController.swift
//  MAD 2018-19
//
//  Created by Samrudh Shenoy on 1/24/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import SCSDKLoginKit

class ConnectViewController: UIViewController {
    
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    @IBOutlet weak var backButton: UIButton!
    var scLoginButton: SCSDKLoginButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton()
        let scLoginButton = SCSDKLoginButton()
        loginButton.center = view.center
        scLoginButton.center = CGPoint(x: 200, y: 200)
        
        view.addSubview(loginButton)
        view.addSubview(scLoginButton)
        
        if backButton != nil {
            self.backButton.layer.cornerRadius = 7
        }
        
        
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
    
    /*
    @IBAction func loginButtonTapped(_ sender: Any) {
        SCSDKLoginClient.login(from: self, completion: { success, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if success {
                self.fetchSnapUserInfo()
            }
        })
    }
    
    private func fetchSnapUserInfo(){
        let graphQLQuery = "{me{displayName, bitmoji{avatar}}}"
        
        SCSDKLoginClient
            .fetchUserData(
                withQuery: graphQLQuery,
                variables: nil,
                success: { userInfo in
                    
                    if let userInfo = userInfo,
                        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted),
                        let userEntity = try? JSONDecoder().decode(UserEntity.self, from: data) {
                        
                        DispatchQueue.main.async {
                            self.goToLoginConfirm(userEntity)
                        }
                    }
            }) { (error, isUserLoggedOut) in
                print(error?.localizedDescription ?? "")
        }
    }
    */

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func loginButtonDidLogOut(_ loginButton: SCSDKLoginButton!) {
        SCSDKLoginClient.unlinkCurrentSession { (success: Bool) in
            // do something
        }
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
