//
//  AddressDefine.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 28/04/2023.
//

import Foundation

enum InfoAddress: String {
    case street = "Street"
    case suite = "Suite"
    case city = "City"
    case zipcode = "Zip"

    func getTitle() -> String {
        return self.rawValue
    }
}
