//
//  MeVC.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/21/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    //Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        emailLbl.text = Auth.auth().currentUser?.email
    }
    

    @IBAction func signOutBtnPressed(_ sender: Any) {
        let logoutPopup = UIAlertController(title: "Logout", message: "Are u sure u want to logout", preferredStyle: .actionSheet)
        
        let logoutAction = UIAlertAction(title: "Logout", style: .destructive) { (buttonTapped) in
            do{
                try Auth.auth().signOut()
                
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC")
                self.present(authVC!, animated: true, completion: nil)
                
            }catch{
                print(error)
            }
            
        }
        
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    
}
