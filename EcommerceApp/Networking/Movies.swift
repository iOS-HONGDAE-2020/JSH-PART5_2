//
//  Movies.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/22.
//  Copyright © 2020 정수현. All rights reserved.
//

import Foundation

struct Movies: Decodable {
    let order_type: Int
    let all: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case order_type
        case all = "movies" // 매우 중요함
    }
}
