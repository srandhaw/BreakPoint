//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/21/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var messageContent: UILabel!
    
    func  configureCell(profileImg: UIImage, email: String, message: String){
        self.profileImg.image = profileImg
        self.email.text = email
        self.messageContent.text = message
        
    }
    
    

}
