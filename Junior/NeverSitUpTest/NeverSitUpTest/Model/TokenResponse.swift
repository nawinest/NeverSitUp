//
//  TokenResponse.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import Foundation

struct TokenResponse: Decodable {
    var status: Int?
    var token: String?
    var customers: [CustomerModel]
}

struct CustomerModel: Decodable {
    var id: String?
    var name: String?
}
