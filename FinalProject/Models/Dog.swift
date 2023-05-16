//
//  Dog.swift
//  Lucky Paw
//
//  Created by Marita Kresic on 03.12.2022..
//

import Foundation
import SwiftUI
import MapKit

class Dog: NSObject, MKAnnotation, Identifiable{
    
    var id: String
    var name: String
    var breed: String
    var age: String
    var weight: String
    var height: String
    var color: String
    var breeder: String
    var image: String
    var gender: String
    var latitude: Double?
    var longitude: Double?
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var behavior: [String]
    var location: CLLocation?
    var availability: String
    var visit: String
    
    func getId() -> String {
        return self.id
    }
    
    func setId(_ _id: String) {
        self.id = _id
    }
    
    func getName() -> String {
        return self.name
    }
    
    func setName(_ _name: String) {
        self.name = _name
    }
    
    func getBreed() -> String {
        return self.breed
    }
    
    func setBreed(_ _breed: String) {
        self.breed = _breed
    }
    
    func getAge() -> String {
        return self.age
    }
    
    func setAge(_ _age: String) {
        self.age = _age
    }
    
    func getWeight() -> String {
        return self.weight
    }
    
    func setWeight(_ _weight: String) {
        self.weight = _weight
    }
    
    func getHeight() -> String {
        return self.height
    }
    
    func setHeight(_ _height: String) {
        self.height = _height
    }
    
    func getColor() -> String {
        return self.color
    }
    
    func setColor(_ _color: String) {
        self.color = _color
    }
    
    func getBreeder() -> String {
        return self.breeder
    }
    
    func setBreeder(_ _breeder: String) {
        self.breeder = _breeder
    }
    
    func getImage() -> String {
        return self.image
    }
    
    func setImage(_ _image: String) {
        self.image = _image
    }
    
    func getGender() -> String {
        return self.gender
    }
    
    func setGender(_ _gender: String) {
        self.gender = _gender
    }
    
    func getLatitude() -> Double? {
        return self.latitude
    }
    
    func setLatitude(_ _latitude: Double?){
        self.latitude = _latitude
    }
    
    func getLongitude() -> Double? {
        return self.longitude
    }
    
    func setLongitude(_ _longitude: Double?){
        self.longitude = _longitude
    }
    
    func getCoordinate()->CLLocationCoordinate2D {
        return self.coordinate
    }
    
    func setCoordinate(_ _coordinate: CLLocationCoordinate2D){
        self.coordinate = _coordinate
    }
    
    func getLocation()->CLLocation? {
        return self.location
    }
    
    func setLocation(_ _location: CLLocation?){
        self.location = _location
    }
    
    func getBehavior() -> [String] {
        return self.behavior
    }
    
    func setBehavior(_ _behavior: [String]) {
        self.behavior = _behavior
    }
    
    func getAvailability() -> String {
        return self.availability
    }
    
    func setAvailability(_ _availability: String) {
        self.availability = _availability
    }
    
    func getVisit() -> String {
        return self.visit
    }
    
    func setVisit(_ _visit: String) {
        self.visit = _visit
    }
    
    override var description: String {return "{\n name: \(name) \n breed: \(breed) \n age: \(age) \n weight: \(weight) \n height: \(height) \n color: \(color) \n breeder: \(breeder) \n image: \(image) \n behavior: \(behavior) \n"}
    
    init(name: String, breed: String, age: String, weight: String, height: String, color: String, breeder: String, image: String, gender: String, coordinate: CLLocationCoordinate2D, location: CLLocation?, behavior: [String], availability: String, visit: String, id: String) {
        self.name = name
        self.breed = breed
        self.age = age
        self.weight = weight
        self.height = height
        self.color = color
        self.breeder = breeder
        self.image = image
        self.gender = gender
        self.coordinate = coordinate
        self.location = location
        self.behavior = behavior
        self.availability = availability
        self.visit = visit
        self.id = id
    }
    
    static func ==(lhs: Dog, rhs: Dog) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
}
