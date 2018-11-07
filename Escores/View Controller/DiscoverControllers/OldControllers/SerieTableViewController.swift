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
        
        //get rid of unused cells
        tableView.tableFooterView = UIView()
        
        self.navigationController!.navigationBar.barStyle = .blackOpaque
        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
        
        if SourceOfTruth.shared.currentLeague?.series?.count == 1{
            OnlyOneSkip()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = SourceOfTruth.shared.currentLeague?.series?.count else {return 0}
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "seriesCell", for: indexPath) as? DiscoverTableViewCell
        
        guard let series = SourceOfTruth.shared.currentLeague?.series else {return UITableViewCell()}
        let year = (series[indexPath.row].year)
        let name = series[indexPath.row].name ?? "Series \(indexPath.row + 1)"
        cell?.myText = "\(name) \nYear: \(year!)"
        
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
        guard let series = SourceOfTruth.shared.currentLeague?.series else {return}
        let serie = series[indexPath.row]
        
        NetworkClient.shared.fetchSeries(seriesID: serie.id) { (series) in
            SourceOfTruth.shared.currentSeries = series
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toTournamentVC", sender: self)
            }
        }
    }
    
    func OnlyOneSkip(){
        guard let series = SourceOfTruth.shared.currentLeague?.series else {return}
        let serie = series[0]
        
        NetworkClient.shared.fetchSeries(seriesID: serie.id) { (series) in
            SourceOfTruth.shared.currentSeries = series
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "toTournamentVC", sender: self)
            }
        }
    }
}
