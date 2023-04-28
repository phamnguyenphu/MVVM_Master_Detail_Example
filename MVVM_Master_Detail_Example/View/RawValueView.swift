//
//  RawValueView.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 28/04/2023.
//

import SwiftUI

struct RawValueView: View {
    // MARK: - PROPERTY

    let title: String
    let value: String

    // MARK: - BODY

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct RawValueView_Previews: PreviewProvider {
    static var previews: some View {
        RawValueView(title: "Email", value: "123@gmail.com")
    }
}
