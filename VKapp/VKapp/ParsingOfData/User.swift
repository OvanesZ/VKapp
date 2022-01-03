//
//  DataUser.swift
//  VKapp
//
//  Created by Ованес on 21.03.2021.
//

import Foundation
import RealmSwift

/*
class Session {
    var token: String = ""
    var userID: String = ""
    
    private init() { }
    
    public static let shared = Session()
}

*/


class Session: RealmSwift.Object {
    @objc dynamic var token: String = ""
    @objc dynamic var userID: String = ""
    @objc dynamic var friendID: String = ""
    
    convenience init(token: String, userID: String, friendID: String) {
        self.init()
        
        self.token = token
        self.userID = userID
        self.friendID = friendID
    }
    public static let shared = Session()
}



