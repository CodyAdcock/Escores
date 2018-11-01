//
//  videoGame.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

//class VideoGame {
//    let id: String
//    let name: String
//    let leagues: [League]
//
//    init(id: String, name: String, leagues: [League]){
//        self.id = id
//        self.name = name
//        self.leagues = leagues
//    }
//}

struct VideoGame: Decodable {
    let id: Int
    let name: String
    let leagues: [LeagueDictionary]
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case leagues = "leagues"
    }
    struct LeagueDictionary: Decodable{
        let id: Int
        let name: String
        let imageUrl: String?
        
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case name = "name"
            case imageUrl = "image_url"
        }
        init(id: Int, name: String, url: String, imageURL: String){
            self.id = id
            self.name = name
            self.imageUrl = imageURL
        }
    }
    init(id: Int, name: String, leagues: [LeagueDictionary]){
        self.id = id
        self.name = name
        self.leagues = leagues
    }
}

//struct VideoGameDictionary: Decodable{
////    let videoGames: [VideoGame]
//    let pubg: VideoGame
//    let overwatch: VideoGame
//    let dota2: VideoGame
//    let csgo: VideoGame
//    let lol: VideoGame
//    
//    private enum CodingKeys: String, CodingKey{
////        case videoGames = "results"
//        case pubg = "Index 0"
//        case overwatch = "Index 1"
//        case dota2 = "Index 2"
//        case csgo = "Index 3"
//        case lol = "Index 4"
//    }
//}

