//
//  ArticlesOutput.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

protocol ArticlesOutput: class {
    func receiveArticles(articles: [Article])
}
