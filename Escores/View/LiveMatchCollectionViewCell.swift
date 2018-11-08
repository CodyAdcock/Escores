//
//  LiveMatchCollectionViewCell.swift
//  Escores
//
//  Created by Cody on 11/7/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class LiveMatchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var VideoGameImage: UIImageView!
    @IBOutlet weak var abbreviationOne: UILabel!
    @IBOutlet weak var teamNameOne: UILabel!
    @IBOutlet weak var scoreOne: UILabel!
    @IBOutlet weak var abbreviationTwo: UILabel!
    @IBOutlet weak var teamNameTwo: UILabel!
    @IBOutlet weak var scoreTwo: UILabel!
  
    
    let bigFont = UIFont(name: "System", size: 17)
    let smallFont = UIFont(name: "System", size: 10)
    
    weak var delegate: LiveTeamSegueDelegate?
    
    var match: Match?{
        didSet{
            guard let teamOne = match?.opponents?[0] else {return}
            guard let teamTwo = match?.opponents?[1] else {return}
            abbreviationOne.text = teamOne.team.acronym
            teamNameOne.text = teamOne.team.name
            abbreviationTwo.text = teamTwo.team.acronym
            teamNameTwo.text = teamTwo.team.name
            
            if abbreviationOne.text == "" || abbreviationTwo.text == ""{
                abbreviationOne.isHidden = true
                abbreviationTwo.isHidden = true
                teamNameOne.font = bigFont
                teamNameTwo.font = bigFont
            }else{
                abbreviationOne.isHidden = false
                abbreviationTwo.isHidden = false
                teamNameOne.font = smallFont
                teamNameTwo.font = smallFont
            }
            if teamNameOne.text == "" || teamNameTwo.text == ""{
                teamNameOne.isHidden = true
                teamNameTwo.isHidden = true
            }else{
                teamNameOne.isHidden = false
                teamNameTwo.isHidden = false
            }
            
            guard let results = match?.results else {return}
            let resultOne = results[0]
            let resultTwo = results[1]
            
            switch resultOne.teamID {
            case teamOne.team.id:
                DispatchQueue.main.async{
                    self.scoreOne.text = "\(resultOne.score)"
                    self.scoreTwo.text = "\(resultTwo.score)"
                }
            case teamTwo.team.id:
                DispatchQueue.main.async{
                    self.scoreTwo.text = "\(resultOne.score)"
                    self.scoreOne.text = "\(resultTwo.score)"
                }
            default:
                return
            }
            
            self.layer.borderWidth = 0.5
            self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.layer.cornerRadius = 5
            //            self.layer.shadowColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
            //            self.layer.shadowRadius = 2
            //            self.layer.shadowOpacity = 0.7
            //            self.layer.shadowOffset = CGSize(width: 2, height: 2)
            //            self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
            self.layer.masksToBounds = false;
        }
    }
    
    var videoGameName: String?{
        didSet{
            switch videoGameName{
            case "PUBG":
                VideoGameImage.image = #imageLiteral(resourceName: "PUBG logo")
            case "Overwatch":
                VideoGameImage.image = #imageLiteral(resourceName: "Overwatch Logo")
            case "Dota 2":
                VideoGameImage.image = #imageLiteral(resourceName: "Dota Logo")
            case "CS:GO":
                VideoGameImage.image = #imageLiteral(resourceName: "CSGO Logo")
            case "LoL":
                VideoGameImage.image = #imageLiteral(resourceName: "League of Legends Logo")
            default:
                VideoGameImage.image = #imageLiteral(resourceName: "logo spaced")
            }
            
        }
    }
    @IBAction func leftButtonTapped(_ sender: Any) {
        //set current team
        guard let opponents = match?.opponents else {return}
        guard let teamID = opponents[0].team.id else {return}
        NetworkClient.shared.fetchTeam(teamID: teamID) { (team) in
            SourceOfTruth.shared.currentTeam = team
            //go to next view
            self.delegate?.segueTime(sender: self)
        }
    }
    @IBAction func rightButtonTapped(_ sender: Any) {
        //set current team
        guard let opponents = match?.opponents else {return}
        guard let teamID = opponents[1].team.id else {return}
        NetworkClient.shared.fetchTeam(teamID: teamID) { (team) in
            SourceOfTruth.shared.currentTeam = team
            //go to next view
            self.delegate?.segueTime(sender: self)
        }

    }
    
}
