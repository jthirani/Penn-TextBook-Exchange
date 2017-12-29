//
//  Book.swift
//  TextbookExchange
//
//  Created by Jai Thirani on 12/6/17.
//  Copyright © 2017 Jai Thirani. All rights reserved.
//

import Foundation
import UIKit

struct Book {
    let bookID: String
    let userID: String
    let course: String
    let title: String
    let price: String
    let ISBN: String
    let condition: String
    //let imageURL: String
    
    init(bookID: String, course:String, title:String, price:String, ISBN:String, condition:String, userID:String/*, imageURL:String*/) {
        self.bookID = bookID
        self.course = course
        self.title = title
        self.price = price
        self.ISBN = ISBN
        self.condition = condition
        self.userID = userID
        //self.imageURL = imageURL
    }
}
