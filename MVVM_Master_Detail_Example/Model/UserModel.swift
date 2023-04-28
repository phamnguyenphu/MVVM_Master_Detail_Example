//
//  UserModel.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 27/04/2023.
//

import Foundation

// MARK: - User

struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo

struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company

struct Company: Codable {
    let name, catchPhrase, bs: String
}

extension User {
    static var dummyData: User {
        .init(id: 1,
              name: "Tunde Ads",
              username: "tundsdev",
              email: "tunds@gmail.com",
              address: .init(street: "Street 1",
                             suite: "Suite 1",
                             city: "Manny",
                             zipcode: "M40 000",
                             geo: .init(lat: "0.61", lng: "0.24")),
              phone: "0161-MANNY-ON-THE-MAP",
              website: "tundsdev.com",
              company: .init(name: "tundsdev",
                             catchPhrase: "tundsdev",
                             bs: ""))
    }
}
