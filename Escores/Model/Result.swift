//
//  Result.swift
//  Escores
//
//  Created by Cody on 10/30/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class Result{
    let score: String
    let id: String
    init(type: String, id: String){
        self.score = type
        self.id = id
    }
}
