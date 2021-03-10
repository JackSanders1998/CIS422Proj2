//
//  UserInfo.swift
//  Fetch
//
//  Created by Ronny on 2/25/21.
//

import SwiftUI

struct JoinedUsers: View {
    @State var totalusers: FetchedResults<USER>
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: USER.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \USER.created, ascending: true)]) var users: FetchedResults<USER>
    
    var body: some View {
            List {
                ForEach(users, id: \.self) { user in
                    VStack (alignment: .leading){
                        Text("Owner: \(user.name)")
                        Text("Dog: \(user.dogName)")
                        Text("Breed: \(user.breed)")
                    }
                    
                }.onDelete(perform: removeUsername)
                
            }
    }
    // Functionality to delete a user
    func removeUsername(at offsets: IndexSet) {
        for index in offsets {
            let user = users[index]
            managedObjectContext.delete(user)
//            do {
//                try managedObjectContext.save()
//            } catch {
//                print(error)
//            }
            try? managedObjectContext.save()
        }
    }
}



//struct JoinedUsers_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = User.
//        JoinedUsers()
//    }
//}

//
//List {
//    ForEach(self.users.indices) { index in
//        Text("\(self.users[index].name!)")
//    }.onDelete(perform: removeUsername)
//}
