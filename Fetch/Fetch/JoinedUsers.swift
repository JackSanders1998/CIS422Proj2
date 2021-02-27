//
//  UserInfo.swift
//  Fetch
//
//  Created by Ronny on 2/25/21.
//

import SwiftUI

struct JoinedUsers: View {
    @State var totalusers: FetchedResults<User>
//    var users: FetchedResults<User>
    
    var body: some View {
        List(self.totalusers.indices) { index in
            Text("\(self.totalusers[index].name!)")
        }
        
    }

}

//struct JoinedUsers_Previews: PreviewProvider {
//    static var previews: some View {
//        let context = User.
//        JoinedUsers()
//    }
//}
