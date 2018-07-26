//
//  ArticlesInteractorOutput.swift
//  Viper
//
//  Created by Leon Ho on 7/25/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

protocol ArticlesInteractorOutput : class {
    func articlesFetched(_ articles: [[String: Any]])
}
