//
//  SecondViewController.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/18/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class GroupVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Variables
    var groupsArray: [Group] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedArray) in
                self.groupsArray = returnedArray
                self.tableView.reloadData()
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell{
            
            cell.configureCell(title: groupsArray[indexPath.row].groupTitle, description: groupsArray[indexPath.row].groupDesc, memberCount: groupsArray[indexPath.row].memberCount)
            return cell
            
        }
        return GroupCell()
    }
    

}

