//
//  DiscoverVideoGameTableViewCell.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class DiscoverVideoGameTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    
    var name: String?{
        didSet{
            switch name{
            case "PUBG":
                logoImage.image = #imageLiteral(resourceName: "PUBG logo")
            case "Overwatch":
                logoImage.image = #imageLiteral(resourceName: "Overwatch Logo")
            case "Dota 2":
                logoImage.image = #imageLiteral(resourceName: "Dota Logo")
            case "CS:GO":
                logoImage.image = #imageLiteral(resourceName: "CSGO Logo")
            case "LoL":
                logoImage.image = #imageLiteral(resourceName: "League of Legends Logo")
            default:
            logoImage.image = #imageLiteral(resourceName: "logo spaced")
            }
            
        }
    }

}
