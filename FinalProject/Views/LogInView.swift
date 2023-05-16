//
//  LogInView.swift
//  FinalProject
//
//  Created by Marita Kresic on 19.11.2022..
//

import Foundation
import SwiftUI
import Firebase

struct LogInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var showAlert = false
    @State private var message = ""
//    @ObservedObject var dataManager = DataManagement()
    
    var body: some View {
        if userIsLoggedIn {
            TabNavigationView().navigationBarBackButtonHidden(true)
        } else {
            content
        }
    }
    
    var content: some View {
        NavigationView {
            VStack {
                VStack(spacing: 20){
                    Text("Log in")
                        .frame(maxWidth: 300, alignment: .leading)
                        .font(.largeTitle)
                    
                    VStack {
                        Text("If you don't have an account, you can")
                            .frame(maxWidth: 300, alignment: .leading)
                        
                        NavigationLink("register here!", destination: SignUpView())
                            .foregroundColor(Color(UIColor(named: "customGreen")!))
                            .bold()
                            .frame(maxWidth: 300, alignment: .leading)
                    }
                }
                
                Spacer()
                    .frame(height: 60)
                
                VStack(spacing: 20){
                    Text("Email")
                        .frame(maxWidth: 300, alignment: .leading)
                    
                    VStack {
                        HStack(spacing: 10) {
                            Image(systemName: "envelope")
                            
                            TextField("Enter your email address", text: $email)
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
                }
                
                Spacer()
                    .frame(height: 60)
                
                Button("Log in") {
                    login()
                }
                .buttonStyle(CustomButton(width: 200))
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Sign In Issue"), message: Text("\(message)"), dismissButton: .default(Text("Got it!")))
                }
            }
            .frame(width: 300)
            .onAppear {
                Auth.auth().addStateDidChangeListener {auth, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                    if user == nil && userIsLoggedIn == true {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {result, error in
            if error != nil {
                print(error!.localizedDescription)
                showAlert = true
                message = error!.localizedDescription
            }
        }
    }
}
