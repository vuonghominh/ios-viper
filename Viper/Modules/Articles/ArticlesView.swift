//
//  ArticlesView.swift
//  Viper
//
//  Created by Leon Ho on 7/17/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

class ArticlesView: UIView {
    // MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: View Setup
    func setupView() {
        self.backgroundColor = UIColor.lightGray
    }
    
    func setupConstraints() {
    }
}
