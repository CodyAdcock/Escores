//
//  DIscoverTableViewCell.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit
import WebKit


class DiscoverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flavorText: UILabel!
    @IBOutlet weak var linkedImage: UIImageView!
    
    var myText: String?{
        didSet{
            flavorText.text = myText
            if linkedImage.image == nil{
                linkedImage.isHidden = true
            }
        }
    }
    var imageAsUrlString: String?{
        didSet{
            guard let imageAsUrlString = imageAsUrlString else {return}
            loadFromURL(urlAsString: imageAsUrlString)
            linkedImage.layer.shadowColor = #colorLiteral(red: 0.2750247121, green: 0.7252599001, blue: 0.8348675966, alpha: 1)
            linkedImage.layer.shadowOffset = CGSize(width: 0, height: 0)
            linkedImage.layer.shadowOpacity = 1
            linkedImage.layer.shadowRadius = 1
            
        }
    }
    
    func loadFromURL(urlAsString: String){
        let myURL = URL(string: urlAsString)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: myURL!){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self.linkedImage.image = image
                        self.linkedImage.isHidden = false
                    }
                }else{
                  print("Image conversion error")
                }
            }
        }
    }
}
