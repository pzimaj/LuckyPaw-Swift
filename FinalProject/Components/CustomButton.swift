//
//  CustomButton.swift
//  FinalProject
//
//  Created by Marita Kresic on 01.12.2022..
//

import Foundation
import SwiftUI

struct CustomButton: ButtonStyle {
    
    var width : CGFloat?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width)
            .padding()
            .background(configuration.isPressed ? Color.green : Color(UIColor(named: "customGreen")!))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(color: Color(UIColor(named: "lightGray")!), radius: 4, x: 1, y: 2)
            .frame(maxWidth: .infinity)
    }
}

struct CustomButtonWhite: ButtonStyle {
    
    var width : CGFloat?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width)
            .padding()
            .background(configuration.isPressed ? Color.green : Color.white)
            .foregroundColor(Color(UIColor(named: "customGreen")!))
            .bold()
            .clipShape(Capsule())
            .shadow(color: .gray, radius: 4, x: 1, y: 2)
    }
}
