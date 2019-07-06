//
//  TableViewCell.swift
//  UserData_Task
//
//  Created by Admin on 06/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    var usermodel: UserModel?{
        
        didSet{
            self.lblName.text = usermodel?.name
            self.lblAddress.text = usermodel?.address
            self.imgView.image  = usermodel?.image
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
