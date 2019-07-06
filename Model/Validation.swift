//
//  Validation.swift
//  UserData_Task
//
//  Created by Admin on 06/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import Foundation
import UIKit


func isEmpty(str: String) -> Bool {
    var isempty = Bool()
    if str.isEmpty{
        isempty = true
    }else{
        isempty = false
    }
    return isempty
}
