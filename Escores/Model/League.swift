//
//  league.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class League{
    let id: String
    let url: String
    let name: String
    let slug: String
    let image_url: String
    let series: [Series]
    
    init(id: String, url: String, name: String, slug: String, image_url: String, series: [Series]){
        self.id = id
        self.url = url
        self.name = name
        self.slug = slug
        self.image_url = image_url
        self.series = series
    }
}
