//
//  Movie.swift
//  EcommerceApp
//
//  Created by 정수현 on 2020/09/21.
//  Copyright © 2020 정수현. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let reservation_grade: Int
    let id: String
    let date: String
    let grade: Int
    let reservation_rate: Double
    let thumb: String
    let user_rating: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case reservation_grade
        case id
        case date
        case grade
        case reservation_rate
        case thumb
        case user_rating
    }
    
}
//// protocol 작동 못함 버림
//extension Movie: Displayable {
//    var title_AF: String {
//        title
//    }
//    var reservation_grade_AF: Int {
//        reservation_grade
//    }
//    var id_AF: String {
//        id
//    }
//    var date_AF: String {
//        date
//    }
//    var grade_AF: Int {
//        grade
//    }
//    var reservation_rate_AF: Double {
//        reservation_rate
//    }
//    var thumb_AF: String {
//        thumb
//    }
//    var user_rating_AF: Double {
//        user_rating
//    }
//}
//
//
