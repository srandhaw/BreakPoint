//
//  NewGroupVC.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/26/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class NewGroupVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
    

    //Outlets
    @IBOutlet weak var titleTextField: InsetTextField!
    @IBOutlet weak var descriptionTextField: InsetTextField!
    @IBOutlet weak var emailSearchTextField: InsetTextField!
    @IBOutlet weak var groupMemberLabel: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func textFieldChanged(){
        if(emailSearchTextField.text == ""){
            emailArray = []
            tableView.reloadData()
        }
        else{
            DataService.instance.getEmail(searchQuery: emailSearchTextField.text!) { (returnEmailArray) in
                self.emailArray = returnEmailArray
                self.tableView.reloadData()
            }
        }
        
    }
    
    //TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell{
            cell.configureCell(profileImg: UIImage(named: "defaultProfileImage")!, email: self.emailArray[indexPath.row], isSelected: true)
            return cell
        }
        return UserCell()
    }
    
}
