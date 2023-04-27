//
//  ContentView.swift
//  MVVM_Master_Detail_Example
//
//  Created by Pham Nguyen Phu on 27/04/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY

    @StateObject var vm = UserViewModel()
    @State private var users = [User]()

    // MARK: - BODY

    var body: some View {
        NavigationStack {
            List {
                ForEach(users, id: \.id) { user in
                    UserItemView(user: user)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Users API")
        }
        .task {
            do {
//                 vm.fetchUsers()
                users = try await vm.getUsers()
            } catch {
                print("Failure in UI")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
