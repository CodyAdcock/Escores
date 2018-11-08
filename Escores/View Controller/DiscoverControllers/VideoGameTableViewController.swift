//
//  DiscoverTableViewController.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class VideoGameTableViewController: UITableViewController {

    var games: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get rid of unused cells
        tableView.tableFooterView = UIView()
        
        let logo = UIImage(named: "logo spaced")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = .white
        
        //mockData
        games = ["PUBG","Overwatch", "Dota 2", "CS:GO", "LoL"]
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return games.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGameCell", for: indexPath) as?DiscoverVideoGameTableViewCell
        cell?.name = games[indexPath.row]
        if(cell!.isSelected){
            cell!.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.6784313725, blue: 0.8, alpha: 1)
        }else{
            cell!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        let game = games[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoGameCell", for: indexPath) as? DiscoverVideoGameTableViewCell
        if(cell!.isSelected){
            cell!.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.6784313725, blue: 0.8, alpha: 1)
        }else{
            cell!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        NetworkClient.shared.fetchVideoGame(game: game) { (videoGame) in
            SourceOfTruth.shared.currentVideoGame = videoGame
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toLeagueVC", sender: self)
            }
        }
    }
    
    
}
