//
//  FinalProjectApp.swift
//  FinalProject
//
//  Created by Marita Kresic on 18.11.2022..
//

import SwiftUI
import Firebase

@main
struct FinalProjectApp: App {
    
    var dogs = Dogs()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dogs)
        }
    }
}
