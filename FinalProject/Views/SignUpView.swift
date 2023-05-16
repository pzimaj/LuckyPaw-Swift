//
//  LoginView.swift
//  FinalProject
//
//  Created by Marita Kresic on 19.11.2022..
//

import Foundation
import SwiftUI
import Firebase

struct SignUpView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var showAlert = false
    @State private var message = ""
    @ObservedObject var dataManager = DataManagement()
    
    var body: some View {
        VStack {
            
            VStack(spacing: 20) {
                Text("Sign up")
                    .frame(maxWidth: 300, alignment: .leading)
                    .font(.largeTitle)
                
                VStack {
                    Text("Here, you can create a new account, if you already don't have one!")
                        .frame(maxWidth: 300, alignment: .leading)
                }
            }
            
            Spacer()
                .frame(height: 60)
            
            VStack(spacing: 20) {
                Text("Email")
                    .frame(maxWidth: 300, alignment: .leading)
                
                VStack {
                    HStack (spacing: 10){
                        Image(systemName: "envelope")
                        
                        TextField("Enter your email address", text: $email)
                            .textFieldStyle(.plain)
                    }
                    
                    Rectangle()
                        .frame(width: 300, height: 1)
                }
                
                Text("Username")
                    .frame(maxWidth: 300, alignment: .leading)
                
                VStack {
                    HStack(spacing: 10) {
                        Image(systemName: "person")
                        
                        TextField("Enter your username", text: $username)
                            .textFieldStyle(.plain)
                    }
                    
                    Rectangle()
                        .frame(width: 300, height: 1)
                }
                
                Text("Password")
                    .frame(maxWidth: 300, alignment: .leading)
                
                VStack {
                    HStack(spacing: 10) {
                        Image(systemName: "lock")
                        
                        SecureField("Enter your password", text: $password)
                            .textFieldStyle(.plain)
                    }
                    
                    Rectangle()
                        .frame(width: 300, height: 1)
                }
                
//                Text("Confirm Password")
//                    .frame(maxWidth: 300, alignment: .leading)
//
//                VStack {
//                    HStack(spacing: 10) {
//                        Image(systemName: "lock")
//
//                        SecureField("Confirm your password", text: $password)
//                            .textFieldStyle(.plain)
//                    }
//
//                    Rectangle()
//                        .frame(width: 300, height: 1)
//                }
            }
            
            Spacer()
                .frame(height: 60)
            
            Button("Sign up") {
                register()
            }
            .buttonStyle(CustomButton(width: 200))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Sign In Issue"), message: Text("\(message)"), dismissButton: .default(Text("Got it!")))
            }
            
        }
        .frame(width: 300)
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) {result, error in
            if error != nil {
                print(error!.localizedDescription)
                showAlert = true
                message = error!.localizedDescription
            }
            
            if let authResult = result {
                let user = User(id: authResult.user.uid, email: email, username: username, dogs: [])
                dataManager.createUser(user: user)
            }
        }
    }
}
