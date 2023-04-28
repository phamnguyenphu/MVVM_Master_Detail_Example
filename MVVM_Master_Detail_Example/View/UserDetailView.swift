//
//  UserDetailView.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 27/04/2023.
//

import SwiftUI

struct UserDetailView: View {
    // MARK: - PROPERTY

    let user: User

    // MARK: - BODY

    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 30) {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(.white)
                        .background(
                            Circle()
                                .fill()
                                .foregroundColor(.blue)
                                .frame(width: 80, height: 80)
                        )
                    Text(user.name)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top, 50)
                .padding(.bottom)

                Form {
                    Section {
                        RawValueView(title: Contact.username.getTitle(), value: user.username)
                        RawValueView(title: Contact.email.getTitle(), value: user.email)
                        RawValueView(title: Contact.phone.getTitle(), value: user.phone)
                        RawValueView(title: Contact.website.getTitle(), value: user.website)
                    } header: {
                        Text("Contact")
                    }

                    Section {
                        RawValueView(title: InfoAddress.street.getTitle(), value: user.address.street)
                        RawValueView(title: InfoAddress.suite.getTitle(), value: user.address.suite)
                        RawValueView(title: InfoAddress.city.getTitle(), value: user.address.city)
                        RawValueView(title: InfoAddress.zipcode.getTitle(), value: user.address.zipcode)
                    } header: {
                        Text("Address")
                    }

                    Section {
                        RawValueView(title: "Name", value: user.company.name)
                    } header: {
                        Text("Company")
                    }
                }
            } // VStack

            // Header
        }
        .navigationTitle("Infomation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User.dummyData)
    }
}
