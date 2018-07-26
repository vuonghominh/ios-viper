//
//  ViewProtocols.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

protocol ReusableView: class {}

protocol NibLoadableView: class {}

protocol IndicatableView: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}
