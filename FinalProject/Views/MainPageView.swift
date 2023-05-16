//
//  MainPageView.swift
//  FinalProject
//
//  Created by Marita Kresic on 19.11.2022..
//

import Foundation
import SwiftUI
import Firebase

struct MainPageView: View {
    
    @EnvironmentObject var dogs: Dogs
    @State var forSearch = ""
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                Text("Explore")
                    .font(.largeTitle)
                    .bold()
                    .frame(width: geo.size.width / 1.17, alignment: .leading)
                    .padding()
                
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1)], spacing: 1) {
                        ForEach(dogs.list, id: \.self) { dog in
                            NavigationLink(destination: DogDetailsView(dog: dog)) {
                                Image("\(dog.getImage())")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: geo.size.width / 3.01, height: geo.size.width / 3.01)
                                    .clipped()
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}
