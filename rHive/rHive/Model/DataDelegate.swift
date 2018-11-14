//
//  DataDelegate.swift
//  rHive
//
//  Created by Mukur Panchani on 14/11/18.
//  Copyright © 2018 M2V. All rights reserved.
//

import Foundation

class DataDelegate {
    
    static func save(thisUser obj: User) -> Void {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: obj)
        userDefaults.set(encodedData, forKey: "thisUser")
        userDefaults.synchronize()
    }
    
    static func retreive(thisUser key: String) -> User {
        let decoded  = UserDefaults.standard.object(forKey: key) as! Data
        let user = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
        return user
    }

}
