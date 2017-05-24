//
//  TableViewExampleViewController.swift
//  CKCC demo
//
//  Created by Student on 4/24/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let courses = ["iOS App Development", "Android App Development", "Mobile App Development", "Korean Language"]
    
    @IBOutlet weak var TableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
    }
    
    //MARK: - Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_course", for: indexPath)
        cell.textLabel?.text = courses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("User click on row: ", indexPath.row)
    }
  
}
