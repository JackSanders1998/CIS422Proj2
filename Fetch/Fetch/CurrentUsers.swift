//
//  CurrentUser.swift
//  Fetch
//
//  Created by Callista West on 3/3/21.
//

import Foundation
import SwiftUI
import UIKit

struct CurrentUsers: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: CurrentUser.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \CurrentUser.created, ascending: true)]) var users: FetchedResults<CurrentUser>
    @State private var username = "Joe"
    @State private var created = ""
    @State private var dogname = "Buddy"
    @State private var dogbreed = "Golden Retriever"
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    
                    //Section below adds boxes for inputting data
                    HStack {
                        Text("Owner:").padding(.trailing, 20)
//                        Image(systemName: "person.fill").foregroundColor(Color.black)
                        TextField("", text: self.$username).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .cornerRadius(100)
                     .opacity(0.9)
                    .padding(.bottom, 15)
                    HStack {
                        Text("Dog Name:").padding(.trailing, 20)
//                        Image(systemName: "person.fill").foregroundColor(Color.black)
                        TextField("", text: self.$dogname).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .cornerRadius(100)
                     .opacity(0.9)
                    .padding(.bottom, 15)
                    HStack {
                        Text("Breed:").padding(.trailing, 20)
//                        Image(systemName: "person.fill").foregroundColor(Color.black)
                        TextField("", text: self.$dogbreed).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .cornerRadius(100)
                     .opacity(0.9)
                    .padding(.bottom, 15)
                    // **** End *****
                    
                    //Section below creates button to display created users
                    
                }
            }
        }
    }



}
