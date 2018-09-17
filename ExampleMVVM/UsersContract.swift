//
//  ExampleContract.swift
//  ExampleMVVM
//
//  Created by Vendpago on 14/09/2018.
//  Copyright © 2018 Alisson. All rights reserved.
//

import Foundation

protocol ViewModelDelegate: class {
    func willLoadData()
    func didLoadData()
}

protocol ViewModelType {
    func bootstrap()
    var delegate: ViewModelDelegate? { get set }
}

protocol UsersViewModelType: ViewModelType {
    var sections: [(name: String, rows: [UserItemModel])]  { get }
}
