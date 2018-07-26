//
//  DetailsPresenter.swift
//  Viper
//
//  Created by Leon Ho on 7/24/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

class DetailsPresenter : DetailsModuleInterface {
    // Instance Variables
    weak var view: DetailsViewInterface!
    var wireframe: DetailsWireframe!
    var article: [String: Any]!
    
    // MARK: DetailsModuleInterface
    func updateView() {
        view.showArticleDetails(article)
    }
}
