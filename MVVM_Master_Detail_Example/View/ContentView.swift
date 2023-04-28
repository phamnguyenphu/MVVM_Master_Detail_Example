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
        if vm.isLoading {
            ProgressView()
        } else {
            NavigationView {
                List {
                    ForEach(users, id: \.id) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            UserItemView(user: user)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Users API")
                .navigationBarTitleDisplayMode(.large)
            }
            .task {
                do {
                    users = try await vm.getUsers()
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
