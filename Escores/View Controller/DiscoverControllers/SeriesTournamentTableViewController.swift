//
//  SeriesTournamentTableViewController.swift
//  Escores
//
//  Created by Cody on 11/5/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

protocol MatchSegueDelegate: class{
    func segueTime(sender: SeriesTableViewCell)
}

class SeriesTournamentTableViewController: UITableViewController, MatchSegueDelegate {

    @IBOutlet weak var LeagueNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get rid of unused cells
        tableView.tableFooterView = UIView()
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
        
        LeagueNameLabel.text = SourceOfTruth.shared.currentLeague?.name
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = SourceOfTruth.shared.currentLeague?.series?.count else {return 0}
        return count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as? SeriesTableViewCell
        cell?.delegate = self
        guard let seriesDictionaries = SourceOfTruth.shared.currentLeague?.series else {return UITableViewCell()}
        cell?.seriesDictionary = seriesDictionaries[indexPath.row]
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
    
    func segueTime(sender: SeriesTableViewCell) {
        DispatchQueue.main.async {
             self.performSegue(withIdentifier: "toMatchVC", sender: self)
        }
    }

}
