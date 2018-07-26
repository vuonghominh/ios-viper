//
//  Articles.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation
import ObjectMapper

struct Article {
    var title: String?
    var website: String?
    var authors: String?
    var content: String?
    var imageUrl: String?
    var date: Date?
}

extension Article: Mappable {
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        title       <- map["title"]
        website     <- map["website"]
        authors     <- map["authors"]
        content     <- map["content"]
        imageUrl    <- map["image"]
        date        <- (map["date"], DateTransform())
    }
}

class ArticlesResponse: Mappable {
    var articles: [Article]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        articles <- map["data"]
    }
}
