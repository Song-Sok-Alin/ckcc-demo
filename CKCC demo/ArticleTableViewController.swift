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

    var articles = [ServerArticle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadArticlesFromServer()
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
    
    func loadArticlesFromDb() -> [Article] {
        let request = NSFetchRequest<Article>(entityName: "Article")
        let result = try! AppDelegate.context.fetch(request)
        return result
            //try! AppDelegate.context.fetch(request)
        
    }
    
    func loadArticlesFromServer() {
        let serverAddress = "http://test.js-cambodia.com/ckcc/news.json"
        let url = URL(string: serverAddress)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let str = String(data: data!, encoding: .utf8)!
            print(str)
            
            // receive data start from here
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [Any]
            var articles = [ServerArticle]()
            for item in json {
                let articleItem = item as! [String:Any]
                let id = articleItem["id"] as! Int
                let title = articleItem["title"] as! String
                let content = articleItem["content"] as! String
                let thumbnail = articleItem["thumbnail_url"] as! String
                
                let article = ServerArticle(id: id, title: title, content: content, date: Date(), thumbnailUrl: thumbnail)
                articles.append(article)
            }
            DispatchQueue.main.async {
                self.articles = articles
                self.tableView.reloadData()
            }
            
        }
        task.resume()
        
    }
  
    @IBAction func onRefreshControlPull(_ sender: Any) {
        print("updating...")
        refreshControl?.endRefreshing()
    }
   
}
