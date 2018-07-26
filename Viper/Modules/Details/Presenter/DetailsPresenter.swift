//
//  DetailsPresenter.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

class DetailsPresenter : DetailsPresentation {
    weak var view: DetailsView?
    var wireframe: DetailsWireframe!
    var article: Article!
    
    func viewDidLoad() {
        view?.showDetails(forArticle: article)
    }
}
