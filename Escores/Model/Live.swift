//
//  Live.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class Live{
    let supported: Bool
    let opensAt: String
    let url: String
    init(supported: Bool, opensAt: String, url: String){
        self.supported = supported
        self.opensAt = opensAt
        self.url = url
    }
}
