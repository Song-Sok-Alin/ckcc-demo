//
//  ContactUsViewController.swift
//  CKCC demo
//
//  Created by Student on 3/27/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit

class ContactUsViewController: UIViewController {

    @IBAction func mapButton(_ sender: Any) {
        print("show map")
        performSegue(withIdentifier: "mapSegue", sender: nil)
   
    }
    
}
