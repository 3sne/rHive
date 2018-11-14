//
//  User.swift
//  rHive
//
//  Created by Vinzy on 13/11/18.
//  Copyright © 2018 M2V. All rights reserved.
//

import Foundation

class User {
    var username: String
    var firstName: String
    var lastName: String
    var realName: String {
        didSet {
            firstName = realName.components(separatedBy: " ").first!
            lastName = realName.components(separatedBy: " ").last!
        }
    }
    var password: String
    var email: String
    var phoneNumber: String
    var address: String
    
    init?(u: String?, fn: String?, ln: String?, ps: String?, em: String?, pn: String?, ad: String?){
        if let u = u, let fn = fn, let ln = ln, let ps = ps, let em = em, let pn = pn, let ad = ad {
            username = u
            firstName = fn
            lastName = ln
            password = ps
            email = em
            phoneNumber = pn
            address = ad
            realName = firstName + " " + lastName
        } else {
            return nil
        }
    }
}
