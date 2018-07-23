//
//  UIFont+Custom.swift
//  Viper
//
//  Created by Leon Ho on 7/18/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import UIKit

extension UIFont {
    @nonobjc static let kDefaultFontThin = "HelveticaNeue-Thin"
    class func regularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: UIFont.kDefaultFontThin, size: size)!
    }
}
