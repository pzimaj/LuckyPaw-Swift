//
//  AppointmentView.swift
//  Lucky Paw
//
//  Created by Marita Kresic on 05.12.2022..
//

import SwiftUI
import Firebase

struct AppointmentView: View {
    
    var dog: Dog
    @ObservedObject var dataManager : DataManagement
    @State private var showAlert = false
    @State private var message = ""
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                DogToMeet(dogId: dog.getId())
                
                Spacer()
                
                Button("Schedule a meeting") {
                    if Auth.auth().currentUser != nil {
                        dataManager.setUser(id: Auth.auth().currentUser!.uid, dogId: dog.getId())
                        showAlert = true
                        message = "You have successfully made a reservation! The team will be contacting you for further instructions."
                    }
                }
                .buttonStyle(CustomButton(width: geo.size.width / 1.5))
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Success!"), message: Text("\(message)"), dismissButton: .default(Text("Got it!")))
                }
            }
        }
    }
}
