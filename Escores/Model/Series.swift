//
//  Series.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class Series{
    let id: String
    let url: String
    let name: String
    let slug: String
    let beginAt: String
    let year: String
    let leagueID: String
    let winnerID: String
    let winnerType: String
    let endAt: String
    let fullName: String
    let tournaments: [Tournament]?
    
    init(id: String, url: String, name: String, slug: String, beginAt: String, year: String, leagueID: String, winnerID: String, winnerType: String, endAt: String, fullName: String, tournaments: [Tournament] = []){
        self.id = id
        self.url = url
        self.name = name
        self.slug = slug
        self.beginAt = beginAt
        self.year = year
        self.leagueID = leagueID
        self.winnerID = winnerID
        self.winnerType = winnerType
        self.endAt = endAt
        self.fullName = fullName
        self.tournaments = tournaments
    }
    
}
