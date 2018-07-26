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
    var title = ""
    var website = ""
    var authors = ""
    var content = ""
    var imageUrl = ""
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
