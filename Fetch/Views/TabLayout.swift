//
//  temporary.swift
//  Fetch
//
//  Created by Ronny on 3/4/21.
//

import SwiftUI
import FirebaseDatabase

struct TabLayout: View {
    @State var targetTab = ""
    var body: some View {
        TabView(selection: $targetTab) {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }.tag("Profile")
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .tag("Deck")
            
            MatchingView()
                .tabItem {
                    Label("Matches", systemImage: "person.2.square.stack.fill")
                }.tag("Matches")
                .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
        }
    }
}

struct TabLayout_Previews: PreviewProvider {
    static var previews: some View {
        TabLayout().environmentObject(SessionStore())
        
    }
}
