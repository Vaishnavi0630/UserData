//
//  ViewController.swift
//  UserData_Task
//
//  Created by Admin on 06/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrData = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
 

    @IBAction func AddClicked(_ sender: Any) {
        
        performSegue(withIdentifier: NextVC, sender: self)
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == NextVC {
            let vc = segue.destination as! UserDataViewController
            vc.DataDelegate = self
        }
    }
}

//MARK:tableView Delegate methods

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cell_Identifier, for: indexPath) as! TableViewCell

        cell.usermodel = arrData[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
}


//MARK:DataPassDelegate method

extension ViewController: DataPassDelegate{
    
    func passData(name: String, address: String, image: UIImage) {
        print("name: \(name) address: \(address) image: \(image)")
        arrData.append(UserModel(name: name, address: address, image: image))
        arrData.contains { (usermodel) -> Bool in
            if arrData.count > 1{
                if usermodel.name == name && !arrData.isEmpty{
                }else{
                    self.tableView.reloadData()
                }
            }else{
                self.tableView.reloadData()
            }
            return true
        }
   }
}




