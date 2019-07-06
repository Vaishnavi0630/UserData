//
//  UserData.swift
//  UserData_Task
//
//  Created by Admin on 06/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import Foundation
import UIKit

struct UserModel {
    
    var name: String?
    var address: String?
    var image: UIImage?
    
    init(name: String,address: String,image: UIImage) {
        
        self.name = name
        self.address = address
        self.image = image
    }
}
