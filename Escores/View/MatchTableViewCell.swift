//
//  MatchTableViewCell.swift
//  Escores
//
//  Created by Cody on 11/5/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    weak var delegate: TeamSegueDelegate?

    
    @IBOutlet weak var abbreviationOne: UILabel!
    @IBOutlet weak var scoreOne: UILabel!
    @IBOutlet weak var abbreviationTwo: UILabel!
    @IBOutlet weak var scoreTwo: UILabel!
    @IBOutlet weak var fullNameTwo: UILabel!
    @IBOutlet weak var fullNameOne: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    var matchDictionary: MatchDictionary?{
        didSet{
            fetchMatches()
        }
    }
    
    var match: Match?{
        didSet{
            guard let opponents = match?.opponents else {return}
            let teamOne = opponents[0].team
            let teamTwo = opponents[1].team
            
            DispatchQueue.main.async {
                self.abbreviationOne.text = teamOne.acronym
                self.abbreviationTwo.text = teamTwo.acronym
                self.fullNameOne.text = teamOne.name
                self.fullNameTwo.text = teamTwo.name
            }
            
            guard let results = match?.results else {return}
            let resultOne = results[0]
            let resultTwo = results[1]
            
            switch resultOne.teamID {
            case teamOne.id:
                DispatchQueue.main.async{
                    self.scoreOne.text = "\(resultOne.score)"
                    self.scoreTwo.text = "\(resultTwo.score)"
                }
            case teamTwo.id:
                DispatchQueue.main.async{
                   self.scoreTwo.text = "\(resultOne.score)"
                    self.scoreOne.text = "\(resultTwo.score)"
                }
            default:
                return
            }
            
        }
    }
    
    func fetchMatches(){
        guard let matchDictionary = matchDictionary else { return }
        NetworkClient.shared.fetchMatch(matchID: matchDictionary.id) { (match) in
            self.match = match
        }
    }
    
    @IBAction func LeftButtonTapped(_ sender: Any) {
        //set current team
        guard let opponents = match?.opponents else {return}
        guard let teamID = opponents[0].team.id else {return}
        NetworkClient.shared.fetchTeam(teamID: teamID) { (team) in
            SourceOfTruth.shared.currentTeam = team
            //go to next view
            self.delegate?.segueTime(sender: self)
        }
        if leftButton.isSelected{
            leftButton.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.6784313725, blue: 0.8, alpha: 0.3522046233)
        }else{
            leftButton.backgroundColor = .clear
        }
    }
    @IBAction func RightButtonTapped(_ sender: Any) {
        //set current team
        guard let opponents = match?.opponents else {return}
        guard let teamID = opponents[1].team.id else {return}
        NetworkClient.shared.fetchTeam(teamID: teamID) { (team) in
            SourceOfTruth.shared.currentTeam = team
            //go to next view
            self.delegate?.segueTime(sender: self)
        }
        if rightButton.isSelected{
            rightButton.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.6784313725, blue: 0.8, alpha: 0.3522046233)
        }else{
            rightButton.backgroundColor = .clear
        }
    }
}
