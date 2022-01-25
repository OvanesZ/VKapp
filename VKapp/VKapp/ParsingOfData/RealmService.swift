//
//  RealmService.swift
//  VKapp
//
//  Created by Ованес Захарян on 14.06.2021.
//

import Foundation
import RealmSwift


class RealmService {
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    static func save<T: Object>(
        items: [T],
        configuration: Realm.Configuration = deleteIfMigration,
        update: Realm.UpdatePolicy
    ) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write {
            realm.add(items, update: update)
            
        }
    }
    
    static func save<T: Object>(
        items: [T],
        configuration: Realm.Configuration = deleteIfMigration
    ) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write {
            realm.add(items)
        }
    }
}







