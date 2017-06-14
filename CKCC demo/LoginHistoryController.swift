//
//  LoginHistoryController.swift
//  CKCC demo
//
//  Created by Student on 5/24/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import CoreData

class LoginHistoryController: UITableViewController {

    var histories: [LoginHistory]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load Login History from database
        let request = NSFetchRequest<LoginHistory>(entityName: "LoginHistory")
        histories = try! AppDelegate.context.fetch(request)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return histories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_login_history")
        let history = histories[indexPath.row]
        cell?.textLabel?.text = history.username
        cell?.detailTextLabel?.text = history.time?.description
        return cell!
    }
}
