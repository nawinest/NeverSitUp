//
//  DetailModel.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import Foundation

struct DetailModel: Decodable {
    var data: Detail?
    var status: Int?
}

struct Detail: Decodable {
    var customerGrade: String?
    var id: String?
    var isCustomerPremium: Bool?
    var name: String?
    var sex: String?
}
