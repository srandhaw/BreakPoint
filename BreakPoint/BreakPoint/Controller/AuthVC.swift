//
//  AuthVC.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/19/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInWithEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func signInWithGoogleBtnPressed(_ sender: Any) {
    }
    
    @IBAction func signInWithFacebookBtnPressed(_ sender: Any) {
    }
    
    
}
