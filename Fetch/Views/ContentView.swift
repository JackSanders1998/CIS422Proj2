//
//  ContentView.swift
//  Fetch
//
//  Created by Ronny on 3/8/21.
//

import SwiftUI
import FirebaseDatabase
struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                TabLayout()
            } else {
                authview()
            }
        }.onAppear(perform: getUser)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}





