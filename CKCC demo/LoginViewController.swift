//
//  LoginViewController.swift
//  CKCC demo
//
//  Created by Student on 3/13/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    //let username = "ckcc"
    //let password = "123"
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let username = UserDefaults.standard.value(forKey: "username") as? String
        if username != nil {
            // logged in 
            //performSegue(withIdentifier: "segue1", sender: nil)
        }
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL )
        
        // Temporary insert users
       /*
        let user1 = NSEntityDescription.insertNewObject(forEntityName: "User", into: AppDelegate.context) as! User
        user1.username = "ckcc"
        user1.password = "123"
        
        let user2 = NSEntityDescription.insertNewObject(forEntityName: "User", into: AppDelegate.context) as! User
        user2.username = "abc"
        user2.password = "124"
        
        let user3 = NSEntityDescription.insertNewObject(forEntityName: "User", into: AppDelegate.context) as! User
        user3.username = "efg"
        user3.password = "125"
        
        let user4 = NSEntityDescription.insertNewObject(forEntityName: "User", into: AppDelegate.context) as! User
        user4.username = "hij"
        user4.password = "126"
        
        try! AppDelegate.context.save()
        */ 
        
    }
    
    @IBAction func loginButton() {
        
        let inputUsername = usernameTextField.text!
        let inputPassword = passwordTextField.text!
        
        if login(withUsername: inputUsername, andPassword: inputPassword) {
            performSegue(withIdentifier: "segue1", sender: nil)
            // save username 
            UserDefaults.standard.set(inputUsername, forKey: "username")
            UserDefaults.standard.synchronize()
            
            // Insert login history
            let loginHistory = NSEntityDescription.insertNewObject(forEntityName: "LoginHistory", into: AppDelegate.context) as! LoginHistory
            loginHistory.username = inputUsername
            loginHistory.time = NSDate()
            try! AppDelegate.context.save()
            
        } else {
            print("Invalid username and password")
        }
        
    }
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    func login(withUsername username: String, andPassword password: String) -> Bool {
        let request = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "username = %@ and password = %@", username, password)
        request.predicate = predicate
        let users = try! AppDelegate.context.fetch(request)
        if users.count > 0 {
            return true
        } else {
            return false
        }
    }
}


