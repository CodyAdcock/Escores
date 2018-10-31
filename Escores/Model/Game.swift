//
//  Game.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class Game{
    let id: String
    let position: String
    let length: String
    let beginAt: String
    let finished: Bool
    let winnerType: String
    let matchID: String
    init(id: String, position: String, length: String, beginAt: String, finished: Bool, winnerType: String, matchID: String){
        self.id = id
        self.position = position
        self.length = length
        self.beginAt = beginAt
        self.finished = finished
        self.winnerType = winnerType
        self.matchID = matchID
    }
}
