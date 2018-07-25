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
        Alamofire.request(url).responseObject {(response: DataResponse<ArticlesResponse>) in
            let articlesResponse = response.result.value
            self.output.articlesFetched(articles: (articlesResponse?.articles)!)
        }
    }
}
