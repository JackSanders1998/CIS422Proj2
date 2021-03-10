//
//  SwiftUIView.swift
//  Fetch
//
//  Created by Ronny on 2/24/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: USER.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \USER.created, ascending: true)]) var users: FetchedResults<USER>

    @State private var username = ""
    @State private var dogname = ""
    @State private var breed = ""
    @State private var created = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    HStack {
                        Text("UserName:").padding(.trailing, 20)
//                        Image(systemName: "person.fill").foregroundColor(Color.black)
                        TextField("", text: self.$username).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .cornerRadius(100)
                     .opacity(0.9)
                     .padding(.bottom, 15)
                    
                    HStack {
                        Text("dogname:").padding(.trailing, 25)
                        TextField("", text: self.$dogname).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .opacity(0.9)
                     .cornerRadius(100)
                     .padding(.bottom, 30)
                    
                    HStack {
                        Text("breed:").padding(.trailing, 25)
                        TextField("", text: self.$breed).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .opacity(0.9)
                     .cornerRadius(100)
                     .padding(.bottom, 30)
                    
                    
                    // Section below adds usernames to coredata
                    Button(action: {
                        let user = USER(context: self.managedObjectContext)
                        user.name = self.username
                        user.dogName = self.dogname
                        user.breed = self.breed
                        user.created = Date()
                        try? self.managedObjectContext.save()
                        self.username = ""
                        self.dogname = ""
                        self.breed = ""
                        
                    }) {
                        
                    Text("Submit")
                        .font(Font.custom("Georgia", size: 40.0, relativeTo: .headline))
                        .italic()
                        .padding(.all, 20)
                        .background(Color.purple)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(.bottom, 15)
                    }
                    // **** End *****
                    
                    NavigationLink(destination: JoinedUsers(totalusers: self.users)) {
                        Text("Show Users")
                            .frame(minWidth: 0, maxWidth: 200)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .font(.title)
                    }
                }
            }
        }
    }

    
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
}
