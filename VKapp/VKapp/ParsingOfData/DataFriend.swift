//
//  DataFriend.swift
//  VKapp
//
//  Created by Ovanes on 03.04.2021.
//

import Foundation

class Friend {

    var friendID: String = ""
    
    private init() { }
    
    public static let shared = Friend()
}
