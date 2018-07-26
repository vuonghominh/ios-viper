//
//  DetailsContract.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

protocol DetailsView: class {
    var presenter: DetailsPresentation! { get set }
    
    func showDetails(forArticle article: Article)
}

protocol DetailsPresentation: class {
    var view: DetailsView? { get set }
    
    func viewDidLoad()
}

protocol DetailsWireframe: class {
    static func assembleModule(_ article: Article) -> UIViewController
}
