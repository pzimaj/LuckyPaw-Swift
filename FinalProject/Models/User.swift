//
//  User.swift
//  FinalProject
//
//  Created by Marita Kresic on 19.11.2022..
//

import Foundation
import SwiftUI

struct User: Identifiable {
    
    var id: String
    var email: String
    var username: String
    var dogs: [String]
    
    func getId() -> String {
        return self.id
    }
    
    mutating func setId(_ _id: String) {
        self.id = _id
    }
    
    func getUsername() -> String {
        return self.username
    }
    
    mutating func setUsername(_ _username: String) {
        self.username = _username
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    mutating func setEmail(_ _email: String) {
        self.email = _email
    }
    
    func getDogs() -> [String] {
        return self.dogs
    }
    
    mutating func setDogs(_ _dogs: [String]) {
        self.dogs = _dogs
    }
}
