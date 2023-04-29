//
//  UserViewModel.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 27/04/2023.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published private(set) var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var error: UserError?
    private let urlString = "https://jsonplaceholder.typicode.com/users"

    func fetchUser() {
        isLoading = true
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                DispatchQueue.main.async {
                    defer {
                        self?.isLoading = false
                    }

                    if let error = error {
                        self?.hasError = true
                        self?.error = .custom(error: error)
                    } else {
                        let decoder = JSONDecoder()

                        if let data = data,
                           let users = try? decoder.decode([User].self, from: data)
                        {
                            self?.users = users
                        } else {
                            self?.hasError = true
                            self?.error = .failedToDecode
                        }
                    }
                } // DispatchQueue
            } // session
            .resume()
        }
    }
}

extension UserViewModel {
    enum UserError: LocalizedError {
        case custom(error: Error)
        case failedToDecode

        var errorDescription: String? {
            switch self {
            case .custom(let error):
                return error.localizedDescription
            case .failedToDecode:
                return "Failed to decode response"
            }
        }
    }
}
