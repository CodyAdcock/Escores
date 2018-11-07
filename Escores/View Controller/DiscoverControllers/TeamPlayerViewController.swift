//
//  TeamPlayerViewController.swift
//  Escores
//
//  Created by Cody on 11/5/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class TeamPlayerViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var playerCollectionView: UICollectionView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        playerCollectionView.delegate = self
        playerCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SourceOfTruth.shared.currentTeam?.players.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell", for: indexPath) as? PlayerCollectionViewCell
        guard let players = SourceOfTruth.shared.currentTeam?.players else {return UICollectionViewCell()}
        cell?.player = players[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
}

//extension TeamPlayerViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width - 16, height: 200)
//    }
//}
