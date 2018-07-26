//
//  NibLoadableViewExtension.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

extension NibLoadableView where Self: UIView {
    static var NibName: String {
        return String(describing: self)
    }
}
