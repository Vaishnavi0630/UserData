//
//  UserDataViewController.swift
//  UserData_Task
//
//  Created by Admin on 06/07/19.
//  Copyright © 2019 Vaishnavi Sasane. All rights reserved.
//

import UIKit


//MARK: decleration of Protocol

protocol DataPassDelegate {
    func passData(name: String,address: String,image: UIImage)
}


class UserDataViewController: UIViewController {
    
    @IBOutlet weak var tableViewDropDown: UITableView!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    
    let uiImagePicker = UIImagePickerController()
    
    var DataDelegate: DataPassDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGuesture = UITapGestureRecognizer()
        imgView.isUserInteractionEnabled = true
        tapGuesture.addTarget(self, action: #selector(openGallery(tap:)))
        imgView.addGestureRecognizer(tapGuesture)
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: open gallery method
    
    @objc func openGallery(tap: UITapGestureRecognizer){
        
        self.setImageToImagePicker()
    }
    
    
    
    @IBAction func SaveClicked(_ sender: Any) {
        
        if !isEmpty(str: txtName.text!) && !isEmpty(str: txtAddress.text!) && imgView.image != nil {
            let image = imgView.image
            
            DataDelegate?.passData(name:txtName.text!, address: txtAddress.text!, image: image!)
            
            self.navigationController?.popViewController(animated: true)
            
        }else{
            print("not validated")
        }
    }
}

// MARK: - tableView Delegate methods


extension UserDataViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewDropDown.dequeueReusableCell(withIdentifier: dropDown_Identifer, for: indexPath)
        
        cell.textLabel?.text = cityArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        txtAddress.text = cityArray[indexPath.row]
        tableViewDropDown.isHidden = true
    }
    
    
}

// MARK: - UITextFieldDelegate methods

extension UserDataViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == txtAddress {
            textField.resignFirstResponder()
            tableViewDropDown.isHidden = false
        }
    }
    
}

// MARK: - UIImagePickerControllerDelegate methods

extension UserDataViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func setImageToImagePicker ()  {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            uiImagePicker.sourceType = .savedPhotosAlbum
            uiImagePicker.delegate = self
            uiImagePicker.isEditing = true
            self.present(uiImagePicker, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        imgView.image = image
        
        self.dismiss(animated: true, completion: nil)
    }
}
