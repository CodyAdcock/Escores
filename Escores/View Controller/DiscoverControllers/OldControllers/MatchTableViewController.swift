//
//  MatchTableViewController.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class MatchTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //get rid of unused cells
        tableView.tableFooterView = UIView()
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = SourceOfTruth.shared.currentTournament?.matches.count else {return 0}
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as? DiscoverTableViewCell
        
        guard let matches = SourceOfTruth.shared.currentTournament?.matches else {return UITableViewCell()}
        let name = matches[indexPath.row].name ?? "Match \(indexPath.row + 1)"
        cell?.myText = name
        
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
        guard let matches = SourceOfTruth.shared.currentTournament?.matches else {return}
        let match = matches[indexPath.row]
        
        NetworkClient.shared.fetchMatch(matchID: match.id) { (match) in
            SourceOfTruth.shared.currentMatch = match
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toTeamVC", sender: self)
            }
        }
    }

}
