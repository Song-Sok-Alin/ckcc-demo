//
//  ProfileViewController.swift
//  CKCC demo
//
//  Created by Student on 3/24/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var placeofbirthLabel: UILabel!
    @IBOutlet weak var profileLoadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileLoadingIndicator.isHidden = false
        
        let url = URL(string: "http://test.js-cambodia.com/ckcc/profile.json")!
        let requestTask = URLSession.shared.dataTask(with: url) { (data, respone, error) in
            let profile = try! JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
            let name = profile["name"] as! String
            let gender = profile["gender"] as! String
            let phone = profile["phone"] as! String
            let email = profile["email"] as! String
            let placeOfBirth = profile["pob"] as! String
            let imageUrl = profile["profile_image"] as! String

            DispatchQueue.main.async {
            self.nameLabel.text = name
            self.genderLabel.text = gender
            self.phoneLabel.text = phone
            self.emailLabel.text = email
            self.placeofbirthLabel.text = placeOfBirth
            self.showProfileImageFromServer(imageUrl: imageUrl)
                
            self.profileLoadingIndicator.isHidden = true
                }
            }
        requestTask.resume()
    }
   
    func showProfileImageFromServer (imageUrl: String) {
        let url = URL(string: imageUrl)!
        let requestImage = URLSession.shared.dataTask(with: url) { (data, respone, error) in
            let image = UIImage(data: data!)
            
            DispatchQueue.main.async {
                self.profileImage.image = image
            }
        }
        requestImage.resume()
    }
    
    @IBAction func editButton(_ sender: Any) {
        print("can edit now")
    
    }
}


