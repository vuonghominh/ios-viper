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

class ArticlesInteractor: ArticlesInteractorInput {
    // MARK: Constants
    let url = "https://www.mocky.io/v2/5b4f433f32000034149c2dea"
    
    // MARK: Instance Variables
    weak var output: ArticlesInteractorOutput!
    
    func fetchArticles() {
        Alamofire.request(url, method: .get).responseObject {(response: DataResponse<ArticlesResponse>) in
            guard let articlesResponse = response.result.value else { return }
            let dictionaries = articlesResponse.articles.map({ (article) -> [[String: Any]] in
                return article.toJSON()
            })
            self.output.articlesFetched(dictionaries!)
        }
    }
}
