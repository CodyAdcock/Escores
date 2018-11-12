//
//  SearchTableViewController.swift
//  Escores
//
//  Created by Cody on 11/2/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var newsSearchBar: UISearchBar!
    var newsArticles: NewsArticles?{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstLoad()
        let logo = UIImage(named: "logo spaced")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = .white
        
        newsSearchBar.delegate = self
    }
    
    func firstLoad(){
        NetworkClient.shared.fetchNews(searchTerm: "") { (articles) in
            guard let articles = articles else {return}
            self.newsArticles = articles
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        NetworkClient.shared.fetchNews(searchTerm: searchBar.text!) { (articles) in
            guard let articles = articles else {return}
            self.newsArticles = articles
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsArticles?.newsArticleDictionary.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as? NewsArticleTableViewCell
        
        cell?.article = newsArticles?.newsArticleDictionary[indexPath.row]
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsURL = newsArticles?.newsArticleDictionary[indexPath.row].url else {return}
        if let url = URL(string: newsURL) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
