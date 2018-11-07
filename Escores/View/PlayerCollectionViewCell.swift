//
//  PlayerCollectionViewCell.swift
//  Escores
//
//  Created by Cody on 11/6/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class PlayerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var gamerTagNameLabel: UILabel!
    @IBOutlet weak var roleTeamVideoGameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    
    var player: PlayerDictionary? {
        didSet{
            DispatchQueue.main.async {
                self.imageView.image = #imageLiteral(resourceName: "not-pictured")
                guard let player = self.player else {return}
                self.imageView.layer.shadowColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
                self.imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
                self.imageView.layer.shadowOpacity = 1
                self.imageView.layer.shadowRadius = 1
                
                self.gamerTagNameLabel.text = "\(player.name ?? "")\n\(player.firstName ?? "") \(player.lastName ?? "")"
                self.roleTeamVideoGameLabel.text = "\(player.role ?? "") \(SourceOfTruth.shared.currentTeam?.name ?? "")"
                self.bioLabel.text = player.bio ?? ""
                guard let url = player.imageURL else {return}
                self.loadFromURL(urlAsString: url)
            }
        }
    }
    
    func loadFromURL(urlAsString: String){
        let myURL = URL(string: urlAsString)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: myURL!){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.imageView.alpha = 0
                        self.imageView.isHidden = false
                        self.imageView.image = image
                        UIView.animate(withDuration: 0.5, animations: {
                            self.imageView.alpha = 1
                        })
                    }
                }else{
                    print("Image conversion error")
                }
            }
        }
    }
    override func prepareForReuse() {
        imageView.image = nil
    }
}
