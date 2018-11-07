//
//  TeamTableViewController.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        //get rid of unused cells
        tableView.tableFooterView = UIView()
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let count = SourceOfTruth.shared.currentMatch?.opponents?.count else {return 0}
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as? DiscoverTableViewCell
        
        guard let team = SourceOfTruth.shared.currentMatch?.opponents?[indexPath.row].team else {return UITableViewCell()}
        cell?.myText = "\(team.name) - \(team.acronym ?? "No Acronym Found")"
        
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
        guard let opponents = SourceOfTruth.shared.currentMatch?.opponents else {return}
        let team = opponents[indexPath.row].team
        guard let id = team.id else {return}
        NetworkClient.shared.fetchTeam(teamID: id) { (team) in
            SourceOfTruth.shared.currentTeam = team
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toPlayerVC", sender: self)
            }
        }
    }
}
