//
//  league.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

//class League{
//    let id: String
//    let url: String
//    let name: String
//    let slug: String
//    let image_url: String
//    let series: [Series]
//
//    init(id: String, url: String, name: String, slug: String, image_url: String, series: [Series]){
//        self.id = id
//        self.url = url
//        self.name = name
//        self.slug = slug
//        self.image_url = image_url
//        self.series = series
//    }
//}

struct League: Decodable{
    let id: Int
    let url: String?
    let name: String?
    let imageUrl: String?
    let series: [SeriesDictionary]?
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case url = "url"
        case name = "name"
        case imageUrl = "image_url"
        case series = "series"
    }
    struct SeriesDictionary: Decodable{
        let id: Int
        let url: String?
        let name: String?
        let year: Int?
        
        private enum CodingKeys: String, CodingKey {
            case id = "id"
            case url = "url"
            case name = "name"
            case year = "year"
        }
    }
}
