//
//  UserInfo.swift
//  Fetch
//
//  Created by Ronny on 2/25/21.
//

import SwiftUI

struct JoinedUsers: View {
    @State var totalusers: FetchedResults<User>
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        List {
            ForEach(self.totalusers.indices) { index in
            Text("\(self.totalusers[index].name)")
                
            }.onDelete(perform: removeUsername)
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
