//
//  Endpoints.swift
//  Viper
//
//  Created by Leon Ho on 7/26/18.
//  Copyright © 2018 Leo. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://www.mocky.io/v2"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Articles: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
                case .fetch: return "/5b4f433f32000034149c2dea"
            }
        }
        
        public var url: String {
            switch self {
                case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
