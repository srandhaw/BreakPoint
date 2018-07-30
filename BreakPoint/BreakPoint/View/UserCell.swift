//
//  UserCell.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/26/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

  //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing: Bool = false
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(selected){
            if(!showing){
            checkImage.isHidden = false
                showing = true
            }else{
                checkImage.isHidden = true
                showing = false
            }
        }        
    }
    
    func configureCell(profileImg: UIImage, email: String, isSelected: Bool ){
        self.profileImage.image = profileImg
        self.emailLabel.text = email
        if(isSelected){
            checkImage.isHidden = false
        }
        else{
            checkImage.isHidden = true
        }
    }

}
