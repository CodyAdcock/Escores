//
//  TournamentMatchesTableViewController.swift
//  Escores
//
//  Created by Cody on 11/5/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

protocol TeamSegueDelegate: class{
    func segueTime(sender: MatchTableViewCell)
}

class TournamentMatchesTableViewController: UITableViewController, TeamSegueDelegate {

    @IBOutlet weak var tournamentNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tournamentNameLabel.text = SourceOfTruth.shared.currentTournament?.name
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let count = SourceOfTruth.shared.currentTournament?.matches.count else {return 0}
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as? MatchTableViewCell
        guard let matchesDictionary = SourceOfTruth.shared.currentTournament?.matches else {return UITableViewCell()}
        cell?.delegate = self
        cell?.matchDictionary = matchesDictionary[indexPath.row]
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.07 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
    func segueTime(sender: MatchTableViewCell) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "toPlayerVC", sender: self)
        }
    }

}
