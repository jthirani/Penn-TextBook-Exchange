//
//  User.swift
//  TextbookExchange
//
//  Created by Jai Thirani on 12/6/17.
//  Copyright © 2017 Jai Thirani. All rights reserved.
//

import Foundation
import FirebaseDatabase
import UIKit
import Firebase
import FirebaseStorage

struct UserDataManager {
    static let userRef = Database.database().reference(withPath: "users")
    
    static let bookRef = Database.database().reference(withPath: "books")
    
    static let courseRef = Database.database().reference(withPath: "courses")
    
    
    static let ref = Database.database().reference()
    
    static func postImage(image: UIImage) {
        
    }
    
    static func removeBook(user: String, bookID: String, course: String) {
        print("A")
        print(bookID)
        bookRef.child(bookID).removeValue()
        print("B")
        ref.child("users").child(ViewController.userID).observeSingleEvent(of: .value) { (snapshot) in
            let booksSnap = snapshot.childSnapshot(forPath: "sellBookIDs")
            //print(booksSnap)
            if let b = booksSnap.value as? [String] {
                var newBooks: [String] = []
                for book in b {
                    if (book == bookID) {
                        continue
                    } else {
                        newBooks.append(book)
                    }
                }
                print("C")
                userRef.child(user).child("sellBookIDs").setValue(newBooks)
            }
        }
        ref.child("courses").child(course).observeSingleEvent(of: .value) { (snapshot) in
            //print(booksSnap)
            if let b = snapshot.value as? [String] {
                var newBooks: [String] = []
                for book in b {
                    if (book == bookID) {
                        continue
                    } else {
                        newBooks.append(book)
                    }
                }
                print("C")
                courseRef.child(course).setValue(newBooks)
            }
        }
    }
    
    static func postUser(user: User) {
        let userData = ["userID": user.userID, "sellBookIDs": user.sellBookIDs] as [String : Any]
        userRef.child(user.userID).setValue(userData)
    }
    
    static func postBook(book: Book/*, image: UIImage?*/) {
        let bookData = ["bookID": book.bookID, "course": book.course.lowercased(), "condition": book.condition, "ISBN": book.ISBN, "price": book.price, "title": book.title, "userID": book.userID/*, "imageURL": book.imageURL*/] as [String : Any]
        bookRef.child(book.bookID).setValue(bookData)
        addBookToUser(bookID: book.bookID)
        
    }
    
    static func postBookByCourse(book: Book) {
        ref.child("courses").observeSingleEvent(of: .value) { (snapshot) in
            var temp : [String] = [book.bookID]
            let booksSnap = snapshot.childSnapshot(forPath: book.course)
            if var b = booksSnap.value as? [String] {
                b.append(book.bookID)
                temp = b
            }
            courseRef.child(book.course).setValue(temp)
        }
    }
    
    static func addBookToUser(bookID: String) {
        ref.child("users").child(ViewController.userID).observeSingleEvent(of: .value) { (snapshot) in
            var temp : [String] = [bookID]
            let booksSnap = snapshot.childSnapshot(forPath: "sellBookIDs")
            if var b = booksSnap.value as? [String] {
                b.append(bookID)
                temp = b
            }
            userRef.child(ViewController.userID).child("sellBookIDs").setValue(temp)
        }
    }
    
    static func getCourseBooks(courseID: String, callback: @escaping (Book) -> ()) {
        ref.child("courses").child(courseID).observeSingleEvent(of: .value) { (snapshot) in
            //print(snapshot)
            if let b = snapshot.value as? [String] {
                for book in b {
                    ref.child("books").child(book).observeSingleEvent(of: .value) { (snapshot) in
                        //print(snapshot)
                        let bookISBN = snapshot.childSnapshot(forPath: "ISBN")
                        let bookTitle = snapshot.childSnapshot(forPath: "title")
                        let bookCondition = snapshot.childSnapshot(forPath: "condition")
                        let bookCourse = snapshot.childSnapshot(forPath: "course")
                        let bookPrice = snapshot.childSnapshot(forPath: "price")
                        let bookuserID = snapshot.childSnapshot(forPath: "userID")
                        //let bookImageURL = snapshot.childSnapshot(forPath: "imageURL")
                        if let userID = bookuserID.value as? String, let title = bookTitle.value as? String, let ISBN = bookISBN.value as? String, let condition = bookCondition.value as? String, let course = bookCourse.value as? String, let price = bookPrice.value as? String/*, let imageURL = bookImageURL.value as? String */{
                            let b:Book = Book(bookID: "", course: course, title: title, price: price, ISBN: ISBN, condition: condition, userID: userID/*, imageURL: imageURL*/)
                            print(b.bookID)
                            callback(b)
                        }
                    }
                    
                }
            }
            
        }
    }
    
    static func getSellingBooks(userID: String, callback: @escaping (Book) -> ()) {
        ref.child("users").child(ViewController.userID).observeSingleEvent(of: .value) { (snapshot) in
            let booksSnap = snapshot.childSnapshot(forPath: "sellBookIDs")
            //print(booksSnap)
            if let b = booksSnap.value as? [String] {
                for book in b {
                    ref.child("books").child(book).observeSingleEvent(of: .value) { (snapshot) in
                        //print(snapshot)
                        let bookISBN = snapshot.childSnapshot(forPath: "ISBN")
                        let bookTitle = snapshot.childSnapshot(forPath: "title")
                        let bookCondition = snapshot.childSnapshot(forPath: "condition")
                        let bookCourse = snapshot.childSnapshot(forPath: "course")
                        let bookPrice = snapshot.childSnapshot(forPath: "price")
                        let bookImageURL = snapshot.childSnapshot(forPath: "imageURL")
                        if let title = bookTitle.value as? String, let ISBN = bookISBN.value as? String, let condition = bookCondition.value as? String, let course = bookCourse.value as? String, let price = bookPrice.value as? String/*, let imageURL = bookImageURL.value as? String*/ {
                            let b:Book = Book(bookID: book, course: course, title: title, price: price, ISBN: ISBN, condition: condition, userID: ""/*, imageURL: imageURL*/)
                            //print(b)
                            callback(b)
                        }
                    }
                    
                }
            }
        }
    }
    
    static func getNumberOfSellingBooks(userID: String) -> Int {
        var c = 0
        ref.child("users").child(ViewController.userID).observeSingleEvent(of: .value) { (snapshot) in
            let booksSnap = snapshot.childSnapshot(forPath: "sellBookIDs")
            if let b = booksSnap.value as? [String] {
                c = b.count
            }
        }
        return c
    }
    
    
}
