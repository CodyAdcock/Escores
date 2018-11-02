//
//  HomeCollectionViewCell.swift
//  Escores
//
//  Created by Cody on 11/2/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var VideoGameImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String?{
        didSet{
            nameLabel.text = name
            
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
}
