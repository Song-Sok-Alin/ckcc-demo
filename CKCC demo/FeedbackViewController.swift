//
//  FeedbackViewController.swift
//  CKCC demo
//
//  Created by Student on 4/24/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let feedback = ["a", "b", "c", "d", "e"]
    
    @IBOutlet weak var TableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedback.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_feedback", for: indexPath)
        cell.textLabel?.text = feedback[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click on row ", indexPath.row)
    }
    
    
    
    
}
