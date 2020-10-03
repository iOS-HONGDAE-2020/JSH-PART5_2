//
//  MovieInfo.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/26.
//  Copyright © 2020 정수현. All rights reserved.
//

import Foundation

struct MovieInfo: Codable {
    let audience: Int
    let grade: Int
    let actor: String
    let duration: Int
    let reservation_grade: Int
    let title: String
    let reservation_rate: Double
    let user_rating: Double
    let date: String
    let director: String
    let id: String
    let image: String
    let synopsis: String
    let genre: String
    
}
