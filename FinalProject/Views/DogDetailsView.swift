//
//  DogDetails.swift
//  FinalProject
//
//  Created by Marita Kresic on 02.12.2022..
//

import Foundation
import SwiftUI

struct DogDetailsView: View {
    
    @EnvironmentObject var dogs: Dogs
    var dog: Dog
    @ObservedObject var dataManager = DataManagement()
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView {
                VStack {
                    Image("\(dog.getImage())")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height / 2.5)
                        .clipped()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: geo.size.width * 0.9, height: geo.size.height / 8)
                            .shadow(color: Color(UIColor(named: "lightGray")!), radius: 4, x: 1, y: 2)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        HStack {
                            VStack {
                                Text("\(dog.getName())")
                                    .font(.title)
                                    .bold()
                                    .frame(width: geo.size.width * 0.7, alignment: .leading)
                                Text("\(dog.getBreed()) - \(dog.getAge())")
                                    .frame(width: geo.size.width * 0.7, alignment: .leading)
                                    .foregroundColor(.gray)
                            }
                            if(dog.getGender().elementsEqual("m")){
                                Image("male")
                            } else {
                                Image("female")
                            }
                        }
                    }
                    
                    VStack {
                        HStack {
                            Image(systemName: "pawprint")
                            Text("About \(dog.getName())")
                                .font(.title2)
                                .bold()
                                .frame(width: geo.size.width * 0.8, alignment: .leading)
                        }.padding(.top, 10)
                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1)], spacing: 2) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: geo.size.width * 0.3, height: geo.size.width * 0.25)
                                    .foregroundColor(Color(UIColor(named: "backGreen")!))
                                VStack {
                                    Text("Weight")
                                        .frame(width: geo.size.width * 0.24, alignment: .leading)
                                        .foregroundColor(.gray)
                                    Text("\(dog.getWeight())")
                                        .frame(width: geo.size.width * 0.24, alignment: .leading)
                                        .bold()
                                        .foregroundColor(Color(UIColor(named: "customGreen")!))
                                }
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: geo.size.width * 0.3, height: geo.size.width * 0.25)
                                    .foregroundColor(Color(UIColor(named: "backGreen")!))
                                VStack {
                                    Text("Height")
                                        .frame(width: geo.size.width * 0.24, alignment: .leading)
                                        .foregroundColor(.gray)
                                    Text("\(dog.getHeight())")
                                        .frame(width: geo.size.width * 0.24, alignment: .leading)
                                        .bold()
                                        .foregroundColor(Color(UIColor(named: "customGreen")!))
                                }
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 25)
                                    .frame(width: geo.size.width * 0.3, height: geo.size.width * 0.25)
                                    .foregroundColor(Color(UIColor(named: "backGreen")!))
                                VStack {
                                    Text("Color")
                                        .frame(width: geo.size.width * 0.24, alignment: .leading)
                                        .foregroundColor(.gray)
                                    Text("\(dog.getColor())")
                                        .frame(width: geo.size.width * 0.24, alignment: .leading)
                                        .bold()
                                        .foregroundColor(Color(UIColor(named: "customGreen")!))
                                }
                            }
                        }
                        .gridColumnAlignment(.center)
                        .padding()
                    }
                    
                    VStack {
                        HStack {
                            Image(systemName: "face.smiling")
                            Text("\(dog.getName()) Behavior")
                                .font(.title2)
                                .bold()
                                .frame(width: geo.size.width * 0.8, alignment: .leading)
                        }.padding(.top, 10)
                        
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)], spacing: 10) {
                            ForEach(dog.getBehavior(), id: \.self) { behavior in
                                ZStack {
                                    Capsule()
                                        .fill(.white)
                                    Capsule()
                                        .stroke(Color(UIColor(named: "customGreen")!))
                                    Text("\(behavior)")
                                        .padding(5)
                                }
                            }
                        }
                        .gridColumnAlignment(.center)
                        .padding()
                    }
                    
                    if(dog.getVisit().elementsEqual("yes")){
                        NavigationLink("Meet me!", destination: AppointmentView(dog: dog, dataManager: dataManager)).buttonStyle(CustomButton(width: geo.size.width / 1.5))
                    }
                }
            }
            
        }
    }
    
}
