//
//  UserViewModel.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 27/04/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published private(set) var users: [User] = []
    @Published private(set) var isLoading: Bool = false
    private var url = URL(string: "https://jsonplaceholder.typicode.com/users")

    func getUsers() async throws -> [User] {
        do {
            let (data, _) = try await URLSession.shared.data(from: url!)

            let decoder = JSONDecoder()

            return try decoder.decode([User].self, from: data)

        } catch {
            return []
        }
    }
}
