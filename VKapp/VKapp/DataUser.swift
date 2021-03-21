//
//  DataUser.swift
//  VKapp
//
//  Created by Ованес on 21.03.2021.
//

import Foundation

class Session {
    var token: String = "user"
    var userID: Int = 12345
    
    private init() { }
    
    static let shared = Session()
}
