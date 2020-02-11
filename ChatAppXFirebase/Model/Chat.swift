//
//  Chat.swift
//  ChatAppXFirebase
//
//  Created by Prapawit Patthasirivichot on 11/2/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import Foundation
enum TypeChat {
    case right
    case left
}
class Chat {
    var type: TypeChat
    var name: String
    var desc: String
    init(type: TypeChat, name: String,desc: String) {
        self.type = type
        self.name = name
        self.desc = desc
    }
}
