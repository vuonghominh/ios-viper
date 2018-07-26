//
//  ArticlesInteractor.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import RxSwift

class ArticlesInteractor: ArticlesUseCase {
    weak var output: ArticlesInteractorOutput!
    private var disposeBag = DisposeBag()
    
    func fetchArticles() {
        ArticlesApiService
            .fetchArticles()
            .subscribe(
                onNext: { articles in
                    self.output.articlesFetched(articles)
                },
                onError: { error in
                    self.output.articlesFetchFailed()
                }
            )
            .disposed(by: disposeBag)
    }
}
