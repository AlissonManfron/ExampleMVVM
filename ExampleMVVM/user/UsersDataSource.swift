//
//  UsersDataSource.swift
//  ExampleMVVM
//
//  Created by Vendpago on 14/09/2018.
//  Copyright © 2018 Alisson. All rights reserved.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String?
    let email: String?
}

protocol UsersDataSourceType {
    func fetchUsers(completion: @escaping (_ result: Result<[User]>) -> Void)
}

class UsersDataSource: UsersDataSourceType {
    
    func fetchUsers(completion: @escaping (_ result: Result<[User]>) -> Void) {
        NetworkClient.get(url: URL(string: "https://jsonplaceholder.typicode.com/users")!) { result in
            completion(result as Result<[User]>)
        }
    }
}
