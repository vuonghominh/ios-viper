//
//  Localization.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

enum Localization {
    enum Articles {
        static let navigationBarTitle = "FEED_NAVIGATION_BAR_TITLE".localized()
        static let sortButtonTitle = "BUTTON_SORT_TITLE".localized()
    }
    
    enum Details {
        static let navigationBarTitle = "DETAILS_NAVIGATION_BAR_TITLE".localized()
    }
    
    enum ArticlesSort {
        static let alertSortByTitle = "ALERT_SORT_BY_TITLE".localized()
        static let dateOption = "ALERT_DATE_OPTION".localized()
        static let titleOption = "ALERT_TITLE_OPTION".localized()
        static let authorOption = "ALERT_AUTHOR_OPTION".localized()
        static let websiteOption = "ALERT_WEBSITE_OPTION".localized()
        static let cancelOption = "ALERT_CANCEL_OPTION".localized()
    }
}
