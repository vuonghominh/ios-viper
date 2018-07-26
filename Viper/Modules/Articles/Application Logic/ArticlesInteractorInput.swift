//
//  ArticlesInteractorInput.swift
//  Viper
//
//  Created by Leon Ho on 7/25/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

protocol ArticlesInteractorInput : class {
    var output: ArticlesInteractorOutput! {get set}
    func fetchArticles()
}
