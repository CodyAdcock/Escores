//
//  Match.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

//class Match {
//    let id: String
//    let tournamentID: String
//    let name: String
//    let beginAt: String
//    let numberOfGames: String
//    let slug: String
//    let draw: Bool
//    let status: String
//    let matchType: String
//    let serieID: String
//    let leagueID: String
//    let games: [Game]
//    let opponents: [Opponent]
//    let serie: Series
//    let league: League
//    let results: Result
//    let winner: Winner
//    let live: Live
//    let videoGame: VideoGame
//    let tournament: Tournament
//    init(id: String, tournamentID: String, name: String, beginAt: String, numberOfGames: String, slug: String, draw: Bool, status: String, matchType: String, serieID: String, leagueID: String, games: [Game], opponents: [Opponent], serie: Series, league: League, results: Result, winner: Winner, live: Live, videoGame: VideoGame, tournament: Tournament){
//        self.id = id
//        self.tournamentID = tournamentID
//        self.name = name
//        self.beginAt = beginAt
//        self.numberOfGames = numberOfGames
//        self.slug = slug
//        self.draw = draw
//        self.status = status
//        self.matchType = matchType
//        self.serieID = serieID
//        self.leagueID = leagueID
//        self.games = games
//        self.opponents = opponents
//        self.serie = serie
//        self.league = league
//        self.results = results
//        self.winner = winner
//        self.live = live
//        self.videoGame = videoGame
//        self.tournament = tournament
//    }
//
//}

struct Match: Decodable{
    let id: Int?
    let name: String?
    let beginAt: String?
    let matchID: String?
    let opponents: [OpponentsDictionary]?
    let currentGame: VideoGameName?

    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case beginAt = "begin_at"
        case matchID = "match_id"
        case opponents = "opponents"
        case currentGame = "videogame"

    }
    
    struct OpponentsDictionary: Decodable{
        let team: TeamDictionary
        
        private enum CodingKeys: String, CodingKey{
         case team = "opponent"
        }
        
        struct TeamDictionary: Decodable{
            let id: Int?
            let name: String
            let acronym: String?
            let imageUrl: String?
            
            private enum CodingKeys: String, CodingKey {
                case id = "id"
                case name = "name"
                case acronym = "acronym"
                case imageUrl = "image_url"
            }
        }
    }
    struct VideoGameName: Decodable{
        let name: String
        
        private enum CodingKeys: String, CodingKey{
            case name = "name"
        }
    }
}
