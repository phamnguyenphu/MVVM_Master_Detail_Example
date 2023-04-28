//
//  ContactDefine.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 28/04/2023.
//

import Foundation

enum Contact: String {
    case username = "User Name"
    case email = "Email"
    case phone = "Phone Number"
    case website = "Website URL"

    func getTitle() -> String {
        return self.rawValue
    }
}
