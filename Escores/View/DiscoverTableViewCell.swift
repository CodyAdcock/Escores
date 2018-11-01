//
//  DIscoverTableViewCell.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class DiscoverTableViewCell: UITableViewCell {

    @IBOutlet weak var flavorText: UILabel!
    @IBOutlet weak var linkedImage: UIImageView!
    
    var myText: String?{
        didSet{
           flavorText.text = myText
        }
    }
    var imageAsUrlString: String?{
        didSet{
            guard let imageAsUrlString = imageAsUrlString else {return}
            loadFromURL(urlAsString: imageAsUrlString)
//            linkedImage.layer.shadowColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
//            linkedImage.layer.shadowOffset = CGSize(width: 5, height: 5)
//            linkedImage.layer.shadowOpacity = 1
//            linkedImage.layer.shadowRadius = 10
        }
    }
    
    func loadFromURL(urlAsString: String){
        let myURL = URL(string: urlAsString)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: myURL!){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.linkedImage.image = image
                    }
                }
            }
        }
    }
    
}
