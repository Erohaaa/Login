//
//  User.swift
//  HomeWork4
//
//  Created by oleg on 12.05.2022.
//

import Foundation

struct logIn {
    let name: String
    let password: String
    
    static func getUserData() -> logIn {
        logIn(name: "dima", password: "ivanov")
    }
}
