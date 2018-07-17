//
//  ArticlesViewController.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class ArticlesViewController : UIViewController {
    var articlesView: ArticlesView!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articlesView = ArticlesView(frame: self.view.frame)
        self.view.addSubview(self.articlesView)
    }
}
