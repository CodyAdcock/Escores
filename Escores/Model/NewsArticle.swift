//
//  NewsArticle.swift
//  Escores
//
//  Created by Cody on 11/8/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

struct NewsArticles: Decodable{
    let newsArticleDictionary: [NewsArticleDictionary]
     private enum CodingKeys: String, CodingKey {
        case newsArticleDictionary = "articles"
    }
}
struct NewsArticleDictionary: Decodable{
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishDate: String?
    let content: String?
    
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishDate = "publishedAt"
        case content = "content"
    }
}
