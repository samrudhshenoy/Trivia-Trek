//
//  AuthViewController.swift
//  MAD 2018-19
//
//  Created by Arthur Lafrance on 2/2/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        PlayerAuth.authenticator.authViewController = self
        
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
