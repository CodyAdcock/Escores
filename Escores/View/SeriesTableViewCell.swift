//
//  SeriesTableViewCell.swift
//  Escores
//
//  Created by Cody on 11/6/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit


class SeriesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var SeriesNameLabel: UILabel!
    @IBOutlet weak var tournamentCollectionView: UICollectionView!
    
    weak var delegate: MatchSegueDelegate?
    
    var seriesDictionary: SeriesDictionary?{
        didSet{
            guard let name = seriesDictionary?.name else {return}
            SeriesNameLabel.text = name.replacingOccurrences(of: " i", with: " I").replacingOccurrences(of: " ii", with: " II").replacingOccurrences(of: " iii", with: " III").replacingOccurrences(of: " iv", with: " IV").capitalized
            fetchSeries()
        }
    }
    
    var series: Series?{
        didSet{
            DispatchQueue.main.async {
                self.tournamentCollectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tournamentCollectionView.dataSource = self
        tournamentCollectionView.delegate = self
    }
    
    func fetchSeries(){
        guard let seriesDictionary = seriesDictionary else { return }
        NetworkClient.shared.fetchSeries(seriesID: seriesDictionary.id) { (series) in
            self.series = series
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let series = self.series else { return 0 }
        return series.tournaments?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TourneyCell", for: indexPath) as? TournamentCollectionViewCell
        if(cell!.isSelected){
            cell!.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.6784313725, blue: 0.8, alpha: 1)
        }else{
            cell!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        guard let tournaments = self.series?.tournaments else {return UICollectionViewCell()}
            cell?.name = tournaments[indexPath.row].name
        return cell ?? UICollectionViewCell()
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
        SourceOfTruth.shared.currentSeries = self.series
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TourneyCell", for: indexPath) as? TournamentCollectionViewCell
        if(cell!.isSelected){
            cell!.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.6784313725, blue: 0.8, alpha: 1)
        }else{
            cell!.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        guard let tournamentDictionaries = series?.tournaments else {return}
        NetworkClient.shared.fetchTournament(tournamentID: tournamentDictionaries[indexPath.row].id) { (tournament) in
            SourceOfTruth.shared.currentTournament = tournament
            DispatchQueue.main.async {
                self.delegate?.segueTime(sender: self)
            }
        }
    }
}
