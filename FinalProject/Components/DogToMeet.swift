//
//  DogToMeet.swift
//  Lucky Paw
//
//  Created by Marita Kresic on 06.12.2022..
//

import SwiftUI

struct DogToMeet: View {
    
    //    var dog: Dog
    var dogId: String
    @State var dogs = Dogs()
    var specificDog : Dog? = nil
    
    mutating func findDog(dogs: Dogs) {
        for dog in dogs.list {
            if(dog.id == self.dogId) {
                specificDog = dog
            }
        }
    }
    
    init(dogId: String, dogs: Dogs = Dogs(), specificDog: Dog? = nil) {
        self.dogId = dogId
        self.dogs = dogs
        self.specificDog = specificDog
        findDog(dogs: dogs)
    }
    
    var body: some View {
        GeometryReader { geo in
            if(dogId != "") {
                NavigationLink(destination: DogDetailsView(dog: specificDog!)) {
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.86)
                                .shadow(color: Color(UIColor(named: "lightGray")!), radius: 4, x: 1, y: 2)
                                .foregroundColor(.white)
                                .padding(.top, 10)
                            VStack{
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(Color(UIColor(named: "customGreen")!))
                                        .cornerRadius(25)
                                        .frame(width: geo.size.width / 1.7, height: geo.size.height / 2.7)
                                    Image("\(specificDog!.getImage())")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: geo.size.width / 2, height: geo.size.height / 3)
                                        .clipped()
                                        .cornerRadius(25)
                                }
                                HStack {
                                    VStack {
                                        Text("\(specificDog!.getName())")
                                            .font(.title)
                                            .bold()
                                            .frame(width: geo.size.width * 0.7, alignment: .leading)
                                        Text("\(specificDog!.getBreed()) - \(specificDog!.getAge())")
                                            .frame(width: geo.size.width * 0.7, alignment: .leading)
                                            .foregroundColor(.gray)
                                    }
                                    if(specificDog!.getGender().elementsEqual("m")){
                                        Image("male")
                                    } else {
                                        Image("female")
                                    }
                                }
                                Text("Availability \(Text("\(specificDog!.getAvailability())").foregroundColor(Color(UIColor(named: "customGreen")!)))")
                                    .font(.title2)
                                    .frame(width: geo.size.width * 0.7, alignment: .center)
                                    .padding()
                            }
                            .padding()
                        }
                        .padding(.leading, geo.size.width / 20)
                    }
                }
            } else {
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.86)
                            .shadow(color: Color(UIColor(named: "lightGray")!), radius: 4, x: 1, y: 2)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        VStack{
                            Text("You have not scheduled a meeting with a dog yet. ")
                                .font(.title2)
                                .frame(width: geo.size.width * 0.7, alignment: .center)
                                .padding()
                        }
                        .padding()
                    }
                    .padding(.leading, geo.size.width / 17)
                }
            }
        }
    }
}
