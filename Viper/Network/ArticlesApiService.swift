//
//  ArticlesApiService.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RxSwift

class ArticlesApiService {
    static func fetchArticles() -> Observable<[Article]> {
        return Observable<[Article]>.create { observer -> Disposable in
            let request = Alamofire
                .request(Endpoints.Articles.fetch.url, method: .get)
                .validate()
                .responseObject {(response: DataResponse<ArticlesResponse>) in
                    switch response.result {
                        case .success(let articlesResponse):
                            observer.onNext(articlesResponse.articles!)
                            observer.onCompleted()
                        case .failure(let error):
                            observer.onError(error)
                    }
            }
            return Disposables.create(with: {
                request.cancel()
            })
        }
    }
}

