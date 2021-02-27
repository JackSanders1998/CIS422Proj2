//
//  SwiftUIView.swift
//  Fetch
//
//  Created by Ronny on 2/24/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(fetchRequest: User.getAllUsers()) var user:FetchedResults<User>
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.created, ascending: true)]) var users: FetchedResults<User>

    @State private var newUser = ""
    @State private var username = ""
    @State private var password = ""
    
    
    var customColor = Color(#colorLiteral(red: 0.4990266562, green: 0.1171680465, blue: 0.5748440027, alpha: 1))
    var body: some View {
        let backgroundImage = Image("IMG_4788").contrast(0.6)
        VStack {
            NavigationView {
            VStack {
                Text("Fetch!")
                    .font(Font.custom("Georgia", size: 120.0, relativeTo: .headline))
                    .italic()
                    .foregroundColor(customColor)
                    .padding(.bottom, 40)
                    
                HStack {
                    Text("UserName:").padding(.trailing, 20)
                    Image(systemName: "person.fill").foregroundColor(Color.black)
                    TextField("", text: self.$username).foregroundColor(.black)
                }.padding()
                 .background(Color.white)
                 .cornerRadius(100)
                 .opacity(0.9)
                 .padding(.bottom, 15)
                
                HStack {
                    Text("Password:").padding(.trailing, 25)
                    Image(systemName: "lock.fill").foregroundColor(.black)
                    SecureField("", text: self.$password).foregroundColor(.black)
                }.padding()
                 .background(Color.white)
                 .opacity(0.9)
                 .cornerRadius(100)
                 .padding(.bottom, 30)
                
                Button(action: {
                    let user = User(context: self.managedObjectContext)
                    user.name = self.username
                    user.created = Date()
                    try? self.managedObjectContext.save()
                    print(user)
                    self.username = ""
                    self.password = ""
                }) {
                Text("Let's Play!")
                    .font(Font.custom("Georgia", size: 40.0, relativeTo: .headline))
                    .italic()
                    .padding(.all, 20)
                    .background(customColor)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                }
                
                NavigationLink(destination: JoinedUsers(totalusers: self.users)) {
                    Text("Current Users")
                        .frame(minWidth: 0, maxWidth: 200)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                        .font(.title)
                }
                
//                ForEach(self.users.indices) { index in
//                    Text("\(self.users[index].name!)")
//                }.onDelete {indexSet in
//                    let removeUser = self.users[indexSet.first!]
//                    self.managedObjectContext.delete(removeUser)
//                    do {
//                        try self.managedObjectContext.save()
//                    } catch {
//                        print(error)
//                    }
//                }

                HStack {
                    VStack {
                        Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                            .frame(width: 200, height: 2)
                        Text("Sign-in")
                            .font(Font.custom("Helvetica-bold", size: 25))
                            .padding(.bottom, 100)
                    }
                }
            }.background(backgroundImage)
        }
    }
    }

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
}
