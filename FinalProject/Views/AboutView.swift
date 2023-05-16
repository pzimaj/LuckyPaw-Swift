//
//  AboutView.swift
//  Lucky Paw
//
//  Created by Marita Kresic on 04.12.2022..
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("About \(Text("Lucky Paw").foregroundColor(Color(UIColor(named: "customGreen")!)))")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .frame(width: geo.size.width, alignment: .leading)
                ZStack {
                    Image("bubble")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geo.size.width, height: geo.size.height * 0.5)
                        .padding(.top, geo.size.height / 15)
                        .clipped()
                    Text("The excessive popularization of giving dogs as gifts for holidays and birthdays has led to the fact that today, unfortunately, there are more and more paws looking for their forever home. This application was created to make it easy to find the perfect home and forever family.")
                        .padding(.top, geo.size.height / 30)
                        .frame(width: geo.size.width / 1.3)
                        .multilineTextAlignment(.center)
                }
                Image("aboutDog")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height * 0.5)
                    .clipped()
            }
        }
    }
}
