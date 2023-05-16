//
//  TabNavigationView.swift
//  Lucky Paw
//
//  Created by Marita Kresic on 04.12.2022..
//

import SwiftUI

enum Tabs: Hashable {
    case explore
    case about
    case user
}

struct TabNavigationView: View {
    
    @State private var tab = Tabs.explore
    @ObservedObject var dataManager = DataManagement()
    var dogs = Dogs()
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $tab) {
                
            MainPageView().navigationBarHidden(true)
            .tabItem {
                Image(systemName: "pawprint")
                Text("Explore")
            }
            .tag(Tabs.explore)
            
            AboutView()
            .tabItem {
                Image(systemName: "questionmark.circle")
                Text("About")
            }
            .tag(Tabs.about)
            
            UserView(dataManager: dataManager, dogs: dogs)
            .tabItem {
                Image(systemName: "person.fill")
                Text("User")
            }
            .tag(Tabs.user)
        }
    }
}
