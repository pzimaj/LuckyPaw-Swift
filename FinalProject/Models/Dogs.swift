//
//  Dogs.swift
//  Lucky Paw
//
//  Created by Marita Kresic on 03.12.2022..
//

import Foundation
import SwiftUI
import CoreLocation

class Dogs: ObservableObject {
    @Published var list: [Dog] = []
//    @State var dogs: [Dog] = []

    init() {
        
        //load data
        if let path = Bundle.main.path(forResource: "dogs", ofType: "plist") {
                    
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let tempDict = try PropertyListSerialization.propertyList(from: data, format: nil) as! [String:Any]
                print("\(String.init(describing: tempDict))")
                let tempArray = tempDict["dogs"]! as! Array<[String:Any]>
                
                var tempDog: [Dog] = []
                for dict in tempArray {
                    print("\(dict)")
                    let id = dict["id"]! as! String
                    let name = dict["name"]! as! String
                    let breed = dict["breed"]! as! String
                    let age = dict["age"]! as! String
                    let weight = dict["weight"]! as! String
                    let height = dict["height"]! as! String
                    let color = dict["color"]! as! String
                    let breeder = dict["breeder"]! as! String
                    let image = dict["image"]! as! String
                    let gender = dict["gender"]! as! String
                    let latitude = Double(dict["latitude"]! as! String)!
                    let longitude = Double(dict["longitude"]! as! String)!
                    let location = CLLocation(latitude: latitude, longitude: longitude)
                    let behavior = dict["behavior"]! as! [String]
                    let availability = dict["availability"]! as! String
                    let visit = dict["visit"]! as! String
                    
                    let d = Dog(name: name, breed: breed, age: age, weight: weight, height: height, color: color, breeder: breeder, image: image, gender: gender, coordinate: location.coordinate, location: location, behavior: behavior, availability: availability, visit: visit, id: id)
                    
                    tempDog.append(d)
                }
                            
                //check to see if the parks were created correctly
                print("There are \(tempDog.count) parks")
                print("\(tempDog)")

                self.list = tempDog.sorted(by:{ $0.getName() < $1.getName() })
            
                print(self.list)
            } catch {
                print(error)
            }
        }
    
    }
}


