//
//  ArticlesInteractor.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ArticlesInteractor: ArticlesProvider {
    weak var output: ArticlesOutput!
    
    func downloadArticles() {
        let url = "http://www.mocky.io/v2/5b4f433f32000034149c2dea"
        Alamofire.request(url).responseJSON {response in
            let articlesArray = response.result.value
            self.output.receiveArticles(articles: articlesArray! as! [Article])
        }
    }
}
