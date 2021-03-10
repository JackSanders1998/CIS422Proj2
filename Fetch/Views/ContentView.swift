//
//  ContentView.swift
//  Fetch
//
//  Created by Ronny on 3/8/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore
    @EnvironmentObject var main: MainStore
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.session != nil) {
                Text("Welcome back!")
                Button(action: main.test) {
                    Text("Sign out")
                }
            } else {
                authview()
//                AuthenticationView()
            }
        }.onAppear(perform: getUser)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SessionStore())
    }
}
