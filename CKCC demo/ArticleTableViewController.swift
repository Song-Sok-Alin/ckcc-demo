//
//  ArticleTableViewController.swift
//  CKCC demo
//
//  Created by Student on 3/29/17.
//  Copyright © 2017 CKCC. All rights reserved.
//

import UIKit
import CoreData

class ArticleTableViewController: UITableViewController {

    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load article from server or database
        articles = loadArticles()
        tableView.reloadData()
        //set article to tableview
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_article", for : indexPath)
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.content
        
        return cell
    }
    
    func loadArticles() -> [Article] {
        let request = NSFetchRequest<Article>(entityName: "Article")
        return try! AppDelegate.context.fetch(request)
        
    }
  
    @IBAction func onRefreshControlPull(_ sender: Any) {
        print("updating...")
        refreshControl?.endRefreshing()
    }
   
}
