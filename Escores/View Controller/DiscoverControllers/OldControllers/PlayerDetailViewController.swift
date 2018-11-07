//
//  PlayerDetailViewController.swift
//  Escores
//
//  Created by Cody on 11/1/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class PlayerDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var firstLastLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var videoGameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let player = SourceOfTruth.shared.currentPlayer else {return}
                
        //hide trouble children for now
        bioLabel.isHidden = true
        teamLabel.isHidden = true
        videoGameLabel.isHidden = true
        
        nameLabel.text = player.name
        firstLastLabel.text = "\(player.firstName ?? "") \(player.lastName ?? "")"
        roleLabel.text = player.role
//        bioLabel.text = player.bio
        hometownLabel.text = player.hometown
//        teamLabel.text = player.currentTeam
//        videoGameLabel.text = player.currentVideoGame
        
        guard let url = player.imageURL else {return}
        loadFromURL(urlAsString: url)
        imageView.layer.shadowColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
        imageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 1
    }
    
    func loadFromURL(urlAsString: String){
        let myURL = URL(string: urlAsString)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: myURL!){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.imageView.image = image
                        UIView.animate(withDuration: 0.5, animations: {
                            self.imageView.isHidden = false
                        })
                    }
                }else{
                    print("Image conversion error")
                }
            }
        }
    }

}
