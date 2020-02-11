//
//  UserDetail.swift
//  ChatAppXFirebase
//
//  Created by Prapawit Patthasirivichot on 11/2/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import Foundation
class UserDetail: Codable{
    var email: String
    var uid: String
    
    init(email: String, uid: String) {
        self.email = email
        self.uid = uid
    }
    
}
