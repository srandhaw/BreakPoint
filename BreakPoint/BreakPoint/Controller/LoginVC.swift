//
//  LoginVC.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/19/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //Outlets
    @IBOutlet weak var emailTextField: InsetTextField!
    @IBOutlet weak var passwordTextField: InsetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInBtnPressed(_ sender: Any) {
        if(emailTextField.text != nil && passwordTextField.text != nil){
            AuthService.instance.loginUser(email: emailTextField.text!, password: passwordTextField.text!) { (success) in
                if(success){
                    self.dismiss(animated: true, completion: nil)
                }
                else{
                    print("\nLogin error\n")
                }
                
                AuthService.instance.registerUser(email: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (success) in
                    if(success){
                        AuthService.instance.loginUser(email: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (success) in
                            if(success){
                                print("successfully registered")
                                self.dismiss(animated: true, completion: nil)
                            }
                        })
                    }else{
                        print("\nRegister error\n")
                    }
                })
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
