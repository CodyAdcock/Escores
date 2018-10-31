//
//  videoGame.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class VideoGame {
    let id: String
    let name: String
    let leagues: [League]
    
    init(id: String, name: String, leagues: [League]){
        self.id = id
        self.name = name
        self.leagues = leagues
    }
}
