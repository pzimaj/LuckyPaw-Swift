//
//  DataManagement.swift
//  Lucky Paw
//
//  Created by Marita Kresic on 05.12.2022..
//

import Foundation
import Firebase
import SwiftUI

class DataManagement: ObservableObject {
    
    @Published var currentUser: User?
    @Published var asyncFetching = true
    var database = Firestore.firestore()
    
    func createUser(user: User) {
        database.collection("users").document(user.getId()).setData([
            "id": user.getId(),
            "username": user.getUsername(),
            "email": user.getEmail(),
            "dog": user.getDogs()
        ]) { error in
            if let error = error {
                print("Error in creating document")
                print(error)
            } else {
                print("Document is created!")
            }
        }
    }
    
    func setUser(id: String, dogId: String) {
        let documentRef = database.collection("users").document(id)

        documentRef.updateData([
            "dog": [dogId]
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    func getUser(id: String) async {
        let documentRef = database.collection("users").document(id)
        
        self.asyncFetching = true
        
        DispatchQueue.main.async {
            documentRef.getDocument(source: .cache) { (document, error) in
                if let document = document, document.exists {
                    let documentData = document.data()
                    let id = documentData?["id"] as? String ?? ""
                    let email = documentData?["email"] as? String ?? ""
                    let username = documentData?["username"] as? String ?? ""
                    let dogs = documentData?["dog"] as? [String] ?? []
                    
                    self.currentUser = User(id: id, email: email, username: username, dogs: dogs)
                    
                    self.asyncFetching = false
                } else {
                    print("There is no document of the sort.")
                }
            }
        }
    }
    
}
