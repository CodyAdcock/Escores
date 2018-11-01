//
//  Tournament.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

//class Tournament{
//    let id: String
//    let name: String
//    let slug: String
//    let winnerID: String
//    let winnerType: String
//    let beginAt: String
//    let endAt: String
//    let serieID: String
//    let leagueID: String
//    let matches: [Match]
//    let teams: [Team]
//    let expectedRoster: [Team]
//    let serie: Series
//    let league: League
//    let videoGame: VideoGame
//
//    init( id: String, name: String, slug: String, winnerID: String, winnerType: String, beginAt: String, endAt: String, serieID: String, leagueID: String, matches: [Match], teams: [Team], expectedRoster: [Team], serie: Series, league: League, videoGame: VideoGame){
//        self.id = id
//        self.name = name
//        self.slug = slug
//        self.winnerID = winnerID
//        self.winnerType = winnerType
//        self.beginAt = beginAt
//        self.endAt = endAt
//        self.serieID = serieID
//        self.leagueID = leagueID
//        self.matches = matches
//        self.teams = teams
//        self.expectedRoster = expectedRoster
//        self.serie = serie
//        self.league = league
//        self.videoGame = videoGame
//    }
//
//}

struct Tournament: Decodable{
    let id: Int
    let name: String?
    let beginAt: String?
    let matches: [MatchDictionary]
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case beginAt = "begin_at"
        case matches = "matches"
    }
    
    struct MatchDictionary: Decodable{
        let id: Int
        let name: String?
        let beginAt: String?
        let matchID: Int?
        
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case beginAt = "begin_at"
            case matchID = "match_id"
        }
    }
}
