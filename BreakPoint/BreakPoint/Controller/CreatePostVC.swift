//
//  CreatePostVC.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/21/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController,UITextViewDelegate {

    //Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        sendBtn.bindToKeyboard()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        emailLbl.text = Auth.auth().currentUser?.email
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textField.text = ""
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if(textField.text != nil && textField.text != "Say something here..."){
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(message: textField.text, uid: (Auth.auth().currentUser?.uid)!, groupKey: nil) { (success) in
                if(success){
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                }
                else{
                    self.sendBtn.isEnabled = true
                    print("error in uploading feed")
                }
            }
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
