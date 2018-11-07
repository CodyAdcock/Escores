//
//  TournamentTableViewController.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class TournamentTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //get rid of unused cells
        tableView.tableFooterView = UIView()
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = SourceOfTruth.shared.currentSeries?.tournaments?.count else {return 0}
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tournamentCell", for: indexPath) as? DiscoverTableViewCell
        
        guard let tournaments = SourceOfTruth.shared.currentSeries?.tournaments else {return UITableViewCell()}
        let name = tournaments[indexPath.row].name ?? "Tournament \(indexPath.row + 1)"
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
        guard let tournaments = SourceOfTruth.shared.currentSeries?.tournaments else {return}
        let tournament = tournaments[indexPath.row]
        
        NetworkClient.shared.fetchTournament(tournamentID: tournament.id) { (tournament) in
            SourceOfTruth.shared.currentTournament = tournament
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toMatchVC", sender: self)
            }
        }
    }

}
