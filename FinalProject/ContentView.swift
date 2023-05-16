//
//  ContentView.swift
//  FinalProject
//
//  Created by Marita Kresic on 18.11.2022..
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dogs: Dogs
    
    var body: some View {
        StarterPageView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Dogs())
    }
}
