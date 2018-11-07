//
//  TournamentCollectionViewCell.swift
//  Escores
//
//  Created by Cody on 11/5/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class TournamentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tournamentNameLabel: UILabel!
    
    
    
    var name: String?{
        didSet{
           
            tournamentNameLabel.text = name?.capitalized.replacingOccurrences(of: " Iv", with: " IV").replacingOccurrences(of: " Iii", with: " III").replacingOccurrences(of: " Ii", with: " II")
            self.layer.borderWidth = 0.5
            self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            self.layer.cornerRadius = 5
            self.layer.masksToBounds = false;
        }
    }
    
}
