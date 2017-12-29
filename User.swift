//
//  User.swift
//  TextbookExchange
//
//  Created by Jai Thirani on 12/6/17.
//  Copyright © 2017 Jai Thirani. All rights reserved.
//

import Foundation

struct User {
    let userID: String
    let sellBookIDs: [String]
    
    init(userID: String, sellBookIDs: [String]) {
        self.userID = userID
        self.sellBookIDs = sellBookIDs
    }
    
}
