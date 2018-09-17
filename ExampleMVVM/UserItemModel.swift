//
//  UserItemModel.swift
//  ExampleMVVM
//
//  Created by Vendpago on 17/09/2018.
//  Copyright © 2018 Alisson. All rights reserved.
//

import Foundation

struct UserItemModel {
    
    var name: String
    var email: String
    
    init(user: User) {
        name = user.name ?? ""
        email = user.email ?? ""
    }
    
}
