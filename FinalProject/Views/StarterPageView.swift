//
//  StarterView.swift
//  FinalProject
//
//  Created by Marita Kresic on 02.12.2022..
//

import Foundation
import SwiftUI

struct StarterPageView: View {
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack{
                    Text("Make a new friend")
//                        .font(Font.custom("BERNIERREGULAR", size: geo.size.width * 0.1))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("with Lucky Paw!")
//                        .font(Font.custom("BERNIERREGULAR", size: geo.size.width * 0.1))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Text("Adopt, don't shop.")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(height: geo.size.height * 0.1)
                    Image("doggy")
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.width)
                    Spacer()
                        .frame(height: geo.size.height * 0.1)
                    NavigationLink("Click to start!", destination: LogInView().navigationBarBackButtonHidden(true))
                        .buttonStyle(CustomButtonWhite(width: geo.size.width / 1.5))
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color(UIColor(named: "customGreen")!))
            }
        }
    }
    
}
