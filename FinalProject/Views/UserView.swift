//
//  UserView.swift
//  Lucky Paw
//
//  Created by Marita Kresic on 04.12.2022..
//

import SwiftUI
import Firebase

struct UserView: View {
    
    @ObservedObject var dataManager : DataManagement
    @State var dogs : Dogs
    @State var specificDog : Dog? = nil
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                if dataManager.asyncFetching {
                    VStack {
                        ProgressView("Loading data...")
                            .frame(width: geo.size.width, alignment: .center)
                        Spacer()
                        Image("aboutDog")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width, height: geo.size.height * 0.5)
                            .clipped()
                    }
                } else {
                    VStack{
                        Text("\(dataManager.currentUser!.username)")
                            .bold()
                            .font(.title2)
                            .padding()
                            .frame(width: geo.size.width, alignment: .leading)
                        Divider()
                            .foregroundColor(.gray)
                        Text("Scheduled to visit")
                            .foregroundColor(.gray)
                            .font(.title2)
                            .padding()
                            .frame(width: geo.size.width, alignment: .leading)
                        if(dataManager.currentUser!.dogs != []){
                            DogToMeet(dogId: dataManager.currentUser!.dogs[0])
                        } else {
                            DogToMeet(dogId: "")
                        }
                        Button {
                            logOut()
                        } label: {
                            Text("Log out")
                                .bold()
                        }.buttonStyle(CustomButton(width: geo.size.width / 1.5))
                    }
                }
            } .task {
                if Auth.auth().currentUser != nil {
                    await dataManager.getUser(id: Auth.auth().currentUser!.uid)
                }
            }
        }
    }
}

func logOut() {
    try! Auth.auth().signOut()
}
