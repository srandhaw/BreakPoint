//
//  AuthService.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/19/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import Foundation
import Firebase

class AuthService{
    static let instance = AuthService()
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let user = result?.user else {
                completion(false)
                return
            }
            
            let userData = ["provider": user.providerID,"email": user.email]
            DataService.instance.createDBUser(uid: user.uid, userData: userData)
            
            completion(true)
            
        }
        
        
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if(error != nil){
                completion(false)
                return
            }
            else{
            completion(true)
            }
        }
    }
    
}

