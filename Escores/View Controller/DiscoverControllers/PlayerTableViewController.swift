//
//  PlayerTableViewController.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = SourceOfTruth.shared.currentTeam?.players.count else {return 0}
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath) as? DiscoverTableViewCell
        
        guard let player = SourceOfTruth.shared.currentTeam?.players[indexPath.row] else {return UITableViewCell()}
        cell?.myText = "\(player.name ?? "") | \(player.firstName ?? "") \(player.lastName ?? "")"
        cell?.imageAsUrlString = player.imageURL
        
        return cell ?? UITableViewCell()
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
        guard let players = SourceOfTruth.shared.currentTeam?.players else {return}
        let player = players[indexPath.row]
        
        NetworkClient.shared.fetchPlayer(playerID: player.id) { (player) in
            DispatchQueue.main.async {
                SourceOfTruth.shared.currentPlayer = player
                self.performSegue(withIdentifier: "toDetailVC", sender: self)
            }
        }
    }

}
