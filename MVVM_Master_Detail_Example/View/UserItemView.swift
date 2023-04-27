//
//  UserItemView.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 27/04/2023.
//

import SwiftUI

struct UserItemView: View {
    // MARK: - PROPERTY

    let user: User

    // MARK: - BODY

    var body: some View {
        HStack(spacing: 30) {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20, alignment: .center)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .fill()
                        .foregroundColor(.blue)
                        .frame(width: 40, height: 40)
                )

            Text(user.name)
                .font(.headline)
                .fontWeight(.medium)
            Spacer()
        }
        .padding()
    }
}

struct UserItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserItemView(user: User.dummyData)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
