//
//  GroupCell.swift
//  BreakPoint
//
//  Created by Sehajbir Randhawa on 7/31/18.
//  Copyright © 2018 Sehajbir. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var memberCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(title: String, description: String, memberCount: Int){
        self.title.text = title
        self.descriptionLabel.text = description
        self.memberCountLabel.text = "\(memberCount) members."
    }

}
