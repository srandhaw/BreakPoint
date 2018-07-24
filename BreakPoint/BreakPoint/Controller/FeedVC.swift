//
//  FirstViewController.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/18/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
   

    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    var messageArray: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DataService.instance.getAllFeedMessages { (returnedMessageArray) in
            self.messageArray = returnedMessageArray.reversed()
            self.tableView.reloadData()
        }
    }

    
    
    //TableView functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCell{
            let image = UIImage(named: "defaultProfileImage")
            let message = messageArray[indexPath.row].content
            var email = messageArray[indexPath.row].senderID
            
            DataService.instance.getUsernameFromUID(uid: email) { (returnedUsername) in
                cell.configureCell(profileImg: image!, email: returnedUsername, message: message)
            }
            
            return cell
        }
        else{
            return FeedCell()
        }
        
    }
    


}

