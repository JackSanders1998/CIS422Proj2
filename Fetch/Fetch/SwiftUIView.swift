//
//  SwiftUIView.swift
//  Fetch
//
//  Created by Ronny on 2/24/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.breed, ascending: true), NSSortDescriptor(keyPath: \User.city, ascending: true), NSSortDescriptor(keyPath: \User.created, ascending: true)]) var users: FetchedResults<User>

    @State private var username = ""
    @State private var password = ""
    @State private var dogname = ""
    @State private var breed = ""
    @State private var created = ""
    @State private var city = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    
                    //Section below adds boxes for inputting data
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
                     .padding(.bottom, 15)
                    
                    HStack {
                        Text("breed:").padding(.trailing, 25)
                        TextField("", text: self.$breed).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .opacity(0.9)
                     .cornerRadius(100)
                     .padding(.bottom, 30)
                    HStack {
                        Text("city:").padding(.trailing, 25)
                        TextField("", text: self.$city).foregroundColor(.black)
                    }.padding()
                     .background(Color.blue)
                     .opacity(0.9)
                     .cornerRadius(100)
                     .padding(.bottom, 30)
                    //**** End ****
                    
                    // Section below adds usernames to coredata
                    Button(action: {
                        let user = User(context: self.managedObjectContext)
                        user.name = self.username
                        user.dogName = self.dogname
                        user.breed = self.breed
                        user.city = self.city
                        user.created = Date()
                        try? self.managedObjectContext.save()
                        print(user)
                        self.dogname = ""
                        self.breed = ""
                        self.city = ""
                        //let curr_user = currentUser(context: self.managedObjectContext)
                        //curr_user.name = self.username
                        //print(curr_user)
                        self.username = ""
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
                    
                    //Section below creates button to display created users
                    NavigationLink(destination: JoinedUsers(totalusers: self.users)) {
                        Text("Show Users")
                            .frame(minWidth: 0, maxWidth: 200)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(40)
                            .padding(.bottom, 15)
                            .font(.title)
                    }
                    // **** End ****
                }
            }
        }
    }

    

//Actually removes the information, whereas JoinedUsers' version invokes the
//delete button
func removeUsername(at offsets: IndexSet) {
    for index in offsets {
        let user = users[index]
        managedObjectContext.delete(user)
    }
}
    
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
}
