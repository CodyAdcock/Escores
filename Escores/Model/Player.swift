//
//  Player.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation
struct Player: Decodable{
    let id: Int?
    let name: String?
    let firstName: String?
    let lastName: String?
    let imageURL: String?
    let role: String?
    let bio: String?
    let hometown: String?
    
    private enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case firstName = "first_name"
        case lastName = "last_name"
        case imageURL = "image_url"
        case role = "role"
        case bio = "bio"
        case hometown = "hometown"

    }
}
