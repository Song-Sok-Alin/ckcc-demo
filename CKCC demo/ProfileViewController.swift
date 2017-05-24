//
//  ProfileViewController.swift
//  CKCC demo
//
//  Created by Student on 3/24/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var placeofbirthLabel: UILabel!
    
    let name = "Alin"
    let gender = "Female"
    let phone = "012 345 678"
    let email = "abc@mail.com"
    let PlaceOfBirth = "Phnom Penh"
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        nameLabel.text = name
        genderLabel.text = gender
        phoneLabel.text = phone
        emailLabel.text = email
        placeofbirthLabel.text = PlaceOfBirth
    }
   
    @IBAction func editButton(_ sender: Any) {
        print("can edit now")
    
    }
    
    
    
    
    
    
    
    
    
    
    
}


