//
//  DataUser.swift
//  VKapp
//
//  Created by Ованес on 21.03.2021.
//

import Foundation

class Session {
    var token: String = ""
    var userID: String = ""
    
    private init() { }
    
    public static let shared = Session()
}


