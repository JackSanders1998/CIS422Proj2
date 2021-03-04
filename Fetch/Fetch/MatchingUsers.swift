//
//  UserInfo.swift
//  Fetch
//
//  Created by Ronny on 2/25/21.
//

import SwiftUI
import UIKit

struct MatchingUsers: View {
    @State var totalusers: FetchedResults<User>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        List {
            VStack (alignment: .leading){
                Text("Matching Functionality").font(.title)
            }
            ForEach(self.totalusers.indices) { index in
                VStack (alignment: .leading){
                    Text("Owner: \(self.totalusers[index].name)")
                    Text("Dog: \(self.totalusers[index].dogName)")
                    Text("Breed: \(self.totalusers[index].breed)")
                    Button(action: { print("matched") }) {
                        Text("Match")
                            .foregroundColor(.green)
                            .padding()
                            .border(Color.green, width: 2)
                            //.offset(x: 150, y: -65)
                    }.buttonStyle(BorderlessButtonStyle())
                    Button(action: { print("declined")}) {
                        Text("Decline")
                            .foregroundColor(.red)
                            .padding()
                            .border(Color.red, width: 2)
                            //.offset(x: 250, y: -125)
                    }.buttonStyle(BorderlessButtonStyle())
                    NavigationLink(destination: CurrentUsers()) {
                        Text("Show CurrrentUser")
                            .frame(minWidth: 0, maxWidth: 200)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .padding(.bottom, 15)
                            .font(.title)
                    }
                }
            }
        }
    }
    // Functionality to delete a user
    
    func removeUsername(at offsets: IndexSet) {
        for index in offsets {
            let user = totalusers[index]
            managedObjectContext.delete(user)
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }

    func matchUsers(at offsets: IndexSet) {
        for index in offsets {
            let user = totalusers[index]
            managedObjectContext.delete(user)
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
}
