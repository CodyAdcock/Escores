//
//  HomeCollectionTableViewController.swift
//  Escores
//
//  Created by Cody on 11/2/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

protocol LiveTeamSegueDelegate: class{
    func segueTime(sender: LiveMatchCollectionViewCell)
}

class HomeCollectionTableViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, LiveTeamSegueDelegate {
    
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    @IBOutlet weak var tournamentsCollectionView: UICollectionView!
    @IBOutlet weak var matchesCollectionView: UICollectionView!
    
    var seriesRunning: [Series] = []
    var tournamentsRunning: [Tournament] = []
    var matchesRunning: [Match] = []
    
    
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
        
        seriesCollectionView.dataSource = self
        seriesCollectionView.delegate = self
        tournamentsCollectionView.dataSource = self
        tournamentsCollectionView.delegate = self
        matchesCollectionView.dataSource = self
        matchesCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //CALL FUNCTIONS
        NetworkClient.shared.fetchSeriesRunning { (series) in
            guard let series = series else {return}
            self.seriesRunning = series
            DispatchQueue.main.async {
                self.seriesCollectionView.reloadData()
            }
            
        }
        NetworkClient.shared.fetchTournamentRunning { (tournaments) in
            guard let tournaments = tournaments else {return}
            self.tournamentsRunning = tournaments
            DispatchQueue.main.async {
                self.tournamentsCollectionView.reloadData()
            }
        }
        NetworkClient.shared.fetchMatchRunning { (matches) in
            guard let matches = matches else {return}
            self.matchesRunning = matches
            DispatchQueue.main.async {
                self.matchesCollectionView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = .black
            headerView.textLabel?.textColor = .white
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case seriesCollectionView:
            return seriesRunning.count
        case tournamentsCollectionView:
            return tournamentsRunning.count
        case matchesCollectionView:
            return matchesRunning.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case seriesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seriesCell", for: indexPath) as? HomeCollectionViewCell
            let seriesName = seriesRunning[indexPath.row].slug
            cell?.name = seriesName.replacingOccurrences(of: "-", with: " ").capitalized.replacingOccurrences(of: "Of", with: "of").replacingOccurrences(of: "20", with: "- 20").replacingOccurrences(of: "Cs Go", with: "CS:GO").replacingOccurrences(of: "Cs", with: "CS")
            cell?.videoGameName = seriesRunning[indexPath.row].currentGame.name
            return cell ?? UICollectionViewCell()
            
        case tournamentsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tournamentsCell", for: indexPath) as? HomeCollectionViewCell
            if tournamentsRunning[indexPath.row].currentGame.name == "LoL"{
                cell?.name = "League of Legends\n\(tournamentsRunning[indexPath.row].name ?? "Unnamed Tournament")"
            }else{
                cell?.name = "\(tournamentsRunning[indexPath.row].currentGame.name)\n\(tournamentsRunning[indexPath.row].name ?? "Unnamed Tournament")"
            }
            cell?.videoGameName = tournamentsRunning[indexPath.row].currentGame.name
            return cell ?? UICollectionViewCell()
            
        case matchesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "matchesCell", for: indexPath) as? LiveMatchCollectionViewCell
            cell?.delegate = self
            cell?.match = matchesRunning[indexPath.row]
            cell?.videoGameName = matchesRunning[indexPath.row].currentGame?.name ?? ""
            return cell ?? UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView{
        case seriesCollectionView:
            NetworkClient.shared.fetchSeries(seriesID: seriesRunning[indexPath.row].id) { (series) in
                SourceOfTruth.shared.currentSeries = series
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toTournamentVC", sender: self)
                }
            }
        case tournamentsCollectionView:
            NetworkClient.shared.fetchTournament(tournamentID: tournamentsRunning[indexPath.row].id) { (tournaments) in
                SourceOfTruth.shared.currentTournament = tournaments
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "toMatchVC", sender: self)
                }
            }
        default:
            return
        }
    }
    func segueTime(sender: LiveMatchCollectionViewCell) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "toPlayerVC", sender: self)
        }
    }
    
}
