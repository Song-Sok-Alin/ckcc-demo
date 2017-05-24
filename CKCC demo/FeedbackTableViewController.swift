//
//  FeedbackTableViewController.swift
//  CKCC demo
//
//  Created by Student on 4/26/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import CoreData

class FeedbackTableViewController: UITableViewController {

    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        articles = loadArticles()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_article1", for: indexPath) as! feedbackTableViewCell
        let article = articles[indexPath.row]
        cell.TitleLabel.text = article.title
        cell.DateLabel.text = article.date?.description
        
        return cell
        
    }
    
    func loadArticles() -> [Article] {
      let request = NSFetchRequest<Article>(entityName: "Article")
        return try! AppDelegate.context.fetch(request)
    }
    
}
