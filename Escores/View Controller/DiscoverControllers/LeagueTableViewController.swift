//
//  LeagueTableViewController.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class LeagueTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = .white
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = SourceOfTruth.shared.currentVideoGame?.leagues.count else {return 0}
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as? DiscoverTableViewCell

        guard let leagues = SourceOfTruth.shared.currentVideoGame?.leagues else {return UITableViewCell()}
        
        cell?.myText = leagues[indexPath.row].name
        cell?.imageAsUrlString = leagues[indexPath.row].imageUrl

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
        guard let leagues = SourceOfTruth.shared.currentVideoGame?.leagues else {return}
        let league = leagues[indexPath.row]
        
        NetworkClient.shared.fetchLeague(leagueID: league.id) { (league) in
            SourceOfTruth.shared.currentLeague = league
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toSeriesVC", sender: self)
            }
        }
    }

}
