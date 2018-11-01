//
//  SerieTableViewController.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class SerieTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = .white
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = SourceOfTruth.shared.currentLeague?.series?.count else {return 0}
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as? DiscoverTableViewCell
        
        guard let series = SourceOfTruth.shared.currentLeague?.series else {return UITableViewCell()}
        let year = (series[indexPath.row].year)
        cell?.myText = "\(series[indexPath.row].name) \nYear: \(year!)"
        
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