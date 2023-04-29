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

    // MARK: - BODY

    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                if vm.isLoading {
                    ProgressView()
                } else {
                    List {
                        ForEach(vm.users, id: \.id) { user in
                            NavigationLink {
                                UserDetailView(user: user)
                            } label: {
                                UserItemView(user: user)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            } // ZStack
            .navigationTitle("Users API MVVM")
            .onAppear(perform: vm.fetchUser)
            .alert(isPresented: $vm.hasError,
                   error: vm.error) {
                Button(action: vm.fetchUser) {
                    Text("Retry")
                }
            }
        } // Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
